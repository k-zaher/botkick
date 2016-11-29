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
      bot_klass_name = self.name.gsub("Bot","")
      node_klass = Object.const_get "#{bot_klass_name}::Node::#{@@starting_node.to_s.capitalize}"
      node = node_klass.new
      node.execute
      rescue NameError => e
        p "Node #{node_klass} does not exist"
        p "Try Running rails g botkick:node #{bot_klass_name.downcase}/#{@@starting_node} to create the node class"
        raise "NodeInvalid"
    end

    def reply!(payload)
      parent = self.name.gsub("Bot","")
      if Object.const_defined?("#{parent}::Node::#{payload}")
        klass = Object.const_get "#{parent}::Node::#{payload}"
      else
        klass = Class.new(self)
      end
      klass.new
    end
  end
end