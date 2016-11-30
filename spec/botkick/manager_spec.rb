require 'spec_helper'

describe Botkick::Manager do
  include_context 'yaml_parser'
  before(:all) do
    @bot_klass = Object.const_set('TestBot', Class.new(Botkick::Base::Bot))
    @bot_klass.send :extend, Botkick::Manager
    TestModuleBot = Module.new
    Node = TestModuleBot.const_set('Node', Module.new)
    @node_klass = TestModuleBot::Node
                  .const_set('Welcome', Class.new(@bot_klass))
  end

  describe '.define_starter' do
    it 'Should set the starter node' do
      @bot_klass.send :define_starter, :welcome
      expect(@bot_klass.starting_node).to eql(:welcome)
    end
  end

  describe '.start!' do
    context 'When Starter is correct' do
      it 'Should return a nested node class' do
        expect(@node_klass).to eql(TestModuleBot::Node::Welcome)
      end

      it 'Should set the starter node' do
        @bot_klass.send :define_starter, :welcome
        overwrite_loader(@node_klass)
        expect(@bot_klass.start!).to eql(exported_yaml)
      end
    end

    context 'When Starter not Found' do
      it 'Should raise an error' do
        @bot_klass.send :define_starter, :thank_you
        expect { @bot_klass.start! }.to raise_error('NodeInvalid')
      end
    end
  end

  describe '.reply!' do
    context 'When target node is defined' do
      before(:all) do
        @input = { 'target_node': 'TestModuleBot::Node::Welcome',
                   'custom_data':
                    {
                      'user_id': '1', 'user_name': 'Tester'
                    } }.to_json
      end
      it 'Should set the starter node' do
        overwrite_loader(@node_klass)
        expect(@bot_klass.reply!(@input)).to eql(exported_yaml)
      end
    end

    context 'When target node is not defined' do
      it 'Should raise an error' do
        @bot_klass.send :define_starter, :thank_you
        expect { @bot_klass.start! }.to raise_error('NodeInvalid')
      end
    end
  end
end
