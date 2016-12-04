module Botkick
  module Base
    # Base Bot class that all bots and nodes will inherit from
    class Bot
      include Serializer
      include YamlLoader

      attr_accessor :templates, :payload_data, :system_data

      def initialize(system_data = {}, payload_data = nil)
        @templates    = prepare_data
        @payload_data = payload_data
        @system_data  = system_data
        after_prepare
      end

      def prepare_data
        import(parse_yaml)
      end

      def after_prepare
        ## To Be Overridden for modifying templates
      end

      def execute
        @templates.map(&:export)
      end
    end
  end
end
