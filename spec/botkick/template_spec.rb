require 'spec_helper'

describe Botkick::Template do
  describe '.export' do
    before do
      @obj = Botkick::Template.new
      @obj.serializer = Botkick::Serializers::Button::Attachment
      @obj.type       = :button
    end
    it 'calls the button template export' do
      allow(Botkick::Serializers::Button::Attachment).to receive(:export) do
        true
      end
      expect(@obj.export).to eql(true)
    end
  end
end

describe Botkick::ButtonTemplate do
end

describe Botkick::ElementTemplate do
end
