module Botkick
  # Bot Starter Module
  module Manager
    def inherited(subclass)
      subclass.instance_eval { undef :start! }
    end

    def define_starter(node)
      @starting_node = node
    end

    def starting_node
      @starting_node
    end

    def start!(system_data = {})
      node = Object.const_get("#{name}::Node::"\
      "#{@starting_node.to_s.split('_').map(&:capitalize).join}")
                   .new(system_data)
      node.execute
    rescue NameError
      p 'Try Running rails g botkick:node '\
      "#{name.downcase}/#{@starting_node} to create the node class"
      raise 'NodeInvalid'
    end

    def self.reply!(payload_string, system_data = {})
      target_node, payload_data = Payload.parse(payload_string)
      raise 'NodeInvalid' unless Object.const_defined?(target_node)
      klass = Object.const_get target_node
      node = klass.new(system_data, payload_data)
      node.execute
    end
  end
end
