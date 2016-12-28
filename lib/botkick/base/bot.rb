module Botkick
  module Base
    # Base Bot class that all bots and nodes will inherit from
    class Bot
      include Serializer
      include YamlLoader

      attr_accessor :templates, :payload_data, :system_data, :serialized_templates

      def initialize(system_data = {}, payload_data = nil)
        @payload_data = payload_data
        @system_data  = system_data
        @templates    = prepare_data
        after_prepare
      end

      def prepare_data
        import(parse_yaml)
      end

      def after_prepare
        ## To Be Overridden for modifying templates
      end

      def execute
        @serialized_templates = @templates.map(&:export)
        after_execute
      end

      def after_execute
        ## To Be Overridden for sending and saving
      end
    end
  end
end
