module Botkick::Base::Bot

  def self.included(base)
    base.send :extend, ClassMethods
  end

  module ClassMethods
		def start!
			p "starting"
		end

		def reply!(payload)
			klass = Object.const_get "#{self.name}::#{payload}"
			klass.new
		end

  end


	def prepare_data
		p "Preparing"
	end

	def execute!
		p "Execute"
	end
end