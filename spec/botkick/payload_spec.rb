require 'spec_helper'

describe Botkick::Payload do
  describe '.parse' do
    before do
      @input = { 'target_node': 'Welcome',
                 'custom_data':
                  {
                    'user_id': '1', 'user_name': 'Tester'
                  } }.to_json
    end

    it 'generates target_node' do
      output = Botkick::Payload.parse(@input)
      expect(output[0]).to eql 'Welcome'
      expect(output[1]).to eql 'user_id' => '1', 'user_name' => 'Tester'
    end
  end
end
