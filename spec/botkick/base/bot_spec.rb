require 'spec_helper'

describe Botkick::Base::Bot do
  before(:all) do
    @klass = Object.const_set('Welcome', Class.new(Botkick::Base::Bot))
  end
  describe '.initialize' do
    before do
      allow_any_instance_of(@klass).to receive(:locate_yaml) do
        'spec/seed/button.yml'
      end
    end

    it 'initializes a new instance with templates' do
      expect(@klass.new.templates.class).to eql(Array)
      expect(@klass.new.templates.first.class).to eql(Botkick::Template)
    end
  end

  describe '.execute' do
    before do
      allow_any_instance_of(@klass).to receive(:locate_yaml) do
        'spec/seed/button.yml'
      end
      @obj = @klass.new
    end

    it 'should call Template export' do
      allow_any_instance_of(Botkick::Template).to receive(:export) do
        true
      end
      expect(@obj.execute).to eql([true] * @obj.templates.count)
    end
  end
end
