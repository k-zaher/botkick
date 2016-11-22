module Botkick::Base::Bot

  def self.included(base)
    base.send :extend, ClassMethods
  end

  module ClassMethods

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

  	def inherited(subclass)
  		subclass.instance_eval { undef :reply! }
  		subclass.instance_eval { undef :start! }
  	end

  end


	def prepare_data
		p "Preparing #{self.class}"
	end

	def execute!
		p "Execute"
	end
end