module Botkick
  module Base
    # Base Bot class that all bots and nodes will inherit from
    class Bot
      include Serializer
      include YamlLoader

      attr_accessor :templates, :custom_data

      def initialize
        @templates = prepare_data
      end

      def prepare_data
        import(parse_yaml)
      end

      def execute
        @templates.map(&:export)
      end
    end
  end
end
