module Botkick
  # Bot Starter Module
  module Manager
    def inherited(subclass)
      subclass.instance_eval { undef :reply! }
      subclass.instance_eval { undef :start! }
    end

    def define_starter(node)
      @starting_node = node
    end

    def start!
      node = Object.const_get("#{name}::Node::"\
      "#{@starting_node.to_s.split('_').map(&:capitalize).join}").new
      node.execute
    rescue NameError
      p 'Try Running rails g botkick:node '\
      "#{name.downcase}/#{@starting_node} to create the node class"
      raise 'NodeInvalid'
    end

    def reply!(payload_string)
      target_node, custom_data = Botkick::Payload.parse(payload_string)
      raise 'Target Node Not Found !!' unless Object.const_defined?(target_node)
      klass = Object.const_get target_node
      klass.new(custom_data: custom_data)
    end
  end
end
