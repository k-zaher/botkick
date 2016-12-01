require 'rails/generators/named_base'

module Botkick
  module Generators # :nodoc:
    class NodeGenerator < ::Rails::Generators::NamedBase # :nodoc:
      class_option(
        :view,
        aliases: '-v',
        type: :array,
        default: 'generic', desc: 'create a yml'
      )

      desc 'This generator creates a node under a bot a its corresponding test'

      def self.default_generator_root
        File.dirname(__FILE__)
      end

      def create_node_file
        bot_name = class_path[0]
        bot_file = "app/bots/#{bot_name}_bot.rb"
        views = @options['view']
        raise 'Nested Nodes is not supported' if class_path.length > 1
        raise '#{bot_name} does not exist' unless File.exist?(bot_file)
        new_file = File.open(yml_file(bot_name), "w+")
        views.each do |view|
          template = File.read(File.dirname(__FILE__) + "/templates/messenger/#{view}.yml.erb")
          new_file << ERB.new(template).result
        end
        # template , yml_file(bot_name)
        template 'node.rb.erb', rb_file(bot_name)
      end

      def create_test_file
        create_node_test(class_path[0])
      end

      private

      def rb_file(bot_name)
        File.join(
          'app/bots',
          "#{bot_name}_bot/node",
          "#{file_name}.rb"
        )
      end

      def yml_file(bot_name)
        File.join(
          'app/bots',
          "#{bot_name}_bot/template",
          "#{file_name}.yml"
        )
      end

      def create_node_test(bot_name)
        template_file = File.join(
          'spec/bots',
          "#{bot_name}_bot/node",
          "#{file_name}_spec.rb"
        )
        template 'node_spec.rb.erb', template_file
      end
    end
  end
end
