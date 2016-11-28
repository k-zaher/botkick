module Botkick
  module Manager

    def inherited(subclass)
      subclass.instance_eval { undef :reply! }
      subclass.instance_eval { undef :start! }
    end

    def start!
      p "starting"
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