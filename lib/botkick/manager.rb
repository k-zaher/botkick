module Botkick
  module Manager

    def inherited(subclass)
      subclass.instance_eval { undef :reply! }
      subclass.instance_eval { undef :start! }
    end

    def start!
      p "starting"
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