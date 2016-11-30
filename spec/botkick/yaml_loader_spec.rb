require 'spec_helper'

describe Botkick::YamlLoader do
  before(:all) do
    @klass = Object.const_set('ClassName', Class.new)
    @klass.send :include, Botkick::YamlLoader
    @klass1 = Object.const_set('Test', Class.new)
    @klass1.send :include, Botkick::YamlLoader
    @obj = @klass.new
    @obj1 = @klass1.new
  end

  describe '.to_underscore' do
    it 'should make an underscored,'\
      'lowercase form from the expression in the string' do
      expect(@obj.to_underscore).to eql ['class_name']
      expect(@obj1.to_underscore).to eql ['test']
    end
  end

  describe '.locate_yaml' do
    it 'Should locate the right path for the yml' do
      expect(@obj.locate_yaml).to eql('app/bots/class_name/'\
        'template/class_name.yml')
    end
  end

  describe '.parse_yaml' do
    include_context 'yaml_parser'
    before do
      overwrite_loader(@klass)
    end
    it 'Should parse the located yml' do
      expect(@obj.parse_yaml).to eql(
        parsed_yaml
      )
    end
  end
end
