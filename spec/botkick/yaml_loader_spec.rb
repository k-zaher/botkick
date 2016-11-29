require 'spec_helper'

describe Botkick::YamlLoader do
  before(:all) do
    @klass = Object.const_set('ClassName', Class.new)
    @klass.send :include, Botkick::YamlLoader
    @obj = @klass.new
  end

  describe '.to_underscore' do
    it 'should make an underscored,'\
      'lowercase form from the expression in the string' do
      expect(@obj.to_underscore).to eql ['class_name']
    end
  end

  describe '.locate_yaml' do
    it 'Should locate the right path for the yml' do
      expect(@obj.locate_yaml).to eql('app/bots/class_name/'\
        'template/class_name.yml')
    end
  end

  describe '.parse_yaml' do
    before do
      allow(@obj).to receive(:locate_yaml) { 'spec/seed/button.yml' }
    end
    it 'Should parse the located yml' do
      expect(@obj.parse_yaml).to eql(
        [
          {
            'template_type' => 'button',
            'text' => nil,
            'buttons' => [
              {
                'title' => nil,
                'type' => 'postback', 'webview_height_ratio' => nil,
                'url' => nil, 'fallback_url' => nil,
                'payload' => { 'target_node' => nil, 'custom_data' => nil }
              }
            ]
          },
          {
            'template_type' => 'button',
            'text' => nil,
            'buttons' => [
              {
                'title' => nil,
                'type' => 'postback', 'webview_height_ratio' => nil,
                'url' => nil, 'fallback_url' => nil,
                'payload' => { 'target_node' => nil, 'custom_data' => nil }
              }
            ]
          }
        ]
      )
    end
  end
end
