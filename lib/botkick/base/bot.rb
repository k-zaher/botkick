module Botkick
  module Base
    class Bot
      include Botkick::Serializer
      include Botkick::YamlLoader

      attr_accessor :templates

      def initialize
        @templates = prepare_data
      end

    	def prepare_data
    		import(parse_yaml)
    	end

    	def execute
        @templates.map{|t| t.export}
    	end
    end
  end
end