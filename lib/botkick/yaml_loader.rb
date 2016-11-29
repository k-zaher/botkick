require 'yaml'
module Botkick
  # Module to locate and parse a yaml file
  module YamlLoader
    def to_underscore
      self.class.name
          .gsub(/::/, '/')
          .gsub(/([A-Z]+)([A-Z][a-z])/, '\1_\2')
          .gsub(/([a-z\d])([A-Z])/, '\1_\2')
          .tr('-', '_')
          .downcase
          .split('/')
    end

    def locate_yaml
      "app/bots/#{to_underscore[0]}/template/#{to_underscore[-1]}.yml"
    end

    def parse_yaml
      YAML.load_file(locate_yaml)
    end
  end
end
