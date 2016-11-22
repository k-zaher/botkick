require 'rails/generators/named_base'

module Botkick
  module Generators # :nodoc:
    class BotGenerator < ::Rails::Generators::NamedBase # :nodoc:

      desc 'This generator creates a Bot in app/bots and a corresponding test'

      check_class_collision suffix: 'Bot'

      def self.default_generator_root
        File.dirname(__FILE__)
      end

      def create_bot_file
        template 'bot.rb.erb', File.join('app/bots', class_path, "#{file_name}_bot.rb")
      end

      def create_test_file
        create_bot_test
      end

      private

      def create_bot_test
        template_file = File.join(
            'spec/bots',
            class_path,
            "#{file_name}_bot_spec.rb"
        )
        template 'bot_spec.rb.erb', template_file
      end
    end
  end
end