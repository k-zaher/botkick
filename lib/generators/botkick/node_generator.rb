require 'rails/generators/named_base'

module Botkick
  module Generators # :nodoc:
    class NodeGenerator < ::Rails::Generators::NamedBase # :nodoc:
      class_option(
        :view,
        aliases: '-v',
        type: :string,
        default: 'generic', desc: 'create a yml'
      )

      desc 'This generator creates a node under a bot a its corresponding test'

      @bot_name = class_path[0]

      def self.default_generator_root
        File.dirname(__FILE__)
      end

      def create_node_file
        bot_file = "app/bots/#{@bot_name}_bot.rb"
        raise 'Nested Nodes is not supported' if class_path.length > 1
        raise '#{@bot_name} does not exist' unless File.exist?(bot_file)
        template "messenger/#{@options['view']}.yml.erb", yml_file
        template 'node.rb.erb', rb_file
      end

      def create_test_file
        create_node_test
      end

      private

      def rb_file
        File.join(
          'app/bots',
          "#{@bot_name}_bot/node",
          "#{file_name}.rb"
        )
      end

      def yml_file
        File.join(
          'app/bots',
          "#{@bot_name}_bot/template",
          "#{file_name}.yml"
        )
      end

      def create_node_test
        template_file = File.join(
          'spec/bots',
          "#{@bot_name}/#{file_name}",
          "#{file_name}_spec.rb"
        )
        template 'node_spec.rb.erb', template_file
      end
    end
  end
end
