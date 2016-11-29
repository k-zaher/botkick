module Botkick
  module Manager

    mattr_accessor :starting_node

    def inherited(subclass)
      subclass.instance_eval { undef :reply! }
      subclass.instance_eval { undef :start! }
    end

    def define_starter(node)
      @@starting_node = node
    end

    def start!
      bot_klass_name = self.name
      node_klass = Object.const_get "#{bot_klass_name}::Node::#{@@starting_node.to_s.split("_").map(&:capitalize).join}"
      node = node_klass.new
      node.execute
      rescue NameError => e
        p "Node #{node_klass} does not exist"
        p "Try Running rails g botkick:node #{bot_klass_name.downcase}/#{@@starting_node} to create the node class"
        raise "NodeInvalid"
    end

    def reply!(payload_string)
      target_node, custom_data = Botkick::Payload.parse(payload_string)
      if Object.const_defined?(target_node)
        klass = Object.const_get target_node
      else
        raise 'Target Node Not Found !!'
      end
      klass.new(custom_data: custom_data)
    end
  end
end