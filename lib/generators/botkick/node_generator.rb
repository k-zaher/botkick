require 'rails/generators/named_base'

module Botkick
  module Generators # :nodoc:
    class NodeGenerator < ::Rails::Generators::NamedBase # :nodoc:
      class_option :override, :aliases => '-o', :type => :boolean, :default => false, :desc => 'create a class'
      class_option :view, :aliases => '-v', :type => :string, :default => "generic", :desc => 'create a yml'

      desc 'This generator creates a node under a bot a its corresponding test'


      def self.default_generator_root
        File.dirname(__FILE__)
      end

      def create_node_file
        return puts   "Err:--------------  Nested Nodes is not supported" if class_path.length > 1
        return puts   "Err:--------------  #{class_path[0]} does not exist" unless File.exist?("app/bots/#{class_path[0]}_bot.rb")
        template "messenger/#{@options["view"]}.yml.erb", File.join('app/bots', "#{class_path[0]}/template", "#{file_name}_bot.yml")
        if @options["override"] == true
          template 'node.rb.erb', File.join('app/bots', "#{class_path[0]}/node", "#{file_name}.rb")
        end
        
      end

      def create_test_file
        create_node_test
      end

      private

      def create_node_test
        template_file = File.join(
            'spec/bots',
            "#{class_path[0]}/#{file_name}",
            "#{file_name}_spec.rb"
        )
        template 'node_spec.rb.erb', template_file
      end
    end
  end
end