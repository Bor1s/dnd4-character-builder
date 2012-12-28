require 'spec_helper'

describe Rule do

  it 'should respond to :name' do
    subject.should respond_to :name
  end

  it 'should respond to :todo' do
    subject.should respond_to :todo
  end

  it 'should respond to :character' do
    subject.should respond_to :character
  end

  it 'should respond_to :root?' do
    subject.should respond_to :root?
  end

  it 'should respond_to :parse' do
    subject.protected_methods.grep(/parse/).should_not be_empty
  end

  context "#process" do

    it 'should raise exception if no character provided' do
      subject.character = nil
      expect { subject.process }.to raise_exception(Rule::NoCharacterProvidedException)
    end

    it 'should raise exception if rule not found' do
      rule = FactoryGirl.create(:incomplete_rule)
      rule.character = FactoryGirl.create(:character, level: 1, expirience: 1)
      rule.command = Command.new
      expect { rule.process }.to raise_exception(Rule::RuleNotFoundException)
    end

    it "should be success for simple rule" do
      rule = FactoryGirl.create(:simple_rule)
      rule.character = FactoryGirl.create(:character, level: 1, expirience: 1)
      rule.command = Command.new
      result = rule.process
      result.should eq 1
    end

    it "should be success for simple rule with multiple result values" do
      rule = FactoryGirl.create(:muliple_result_rule)
      rule.character = FactoryGirl.create(:character, level: 1, expirience: 1)
      rule.command = Command.new
      result = rule.process
      result.should eq [1,2]
    end

    it "should fail if no storage provided in Character class" do
      rule = FactoryGirl.create(:with_store_rule)
      rule.character = FactoryGirl.create(:character, level: 1, expirience: 1)
      rule.command = Command.new
      expect { rule.process }.to raise_exception(Rule::NoStorageForRuleResultException)
    end
    
    it "should be success for simple rule with condition" do
      rule = FactoryGirl.create(:simple_rule_with_condition)
      rule.character = FactoryGirl.create(:character, level: 1, expirience: 1)
      rule.command = Command.new
      result = rule.process
      result.should eq 1
    end
    
    it "should fail for simple rule if condition failed" do
      rule = FactoryGirl.create(:simple_rule_with_bad_condition)
      rule.character = FactoryGirl.create(:character, level: 1, expirience: 1)
      rule.command = Command.new
      expect { rule.process }.to raise_exception(Rule::ConditionFailed)
    end

    it "should be success for simple rule with storage" do
      rule = FactoryGirl.create(:test_character_expirience_rule)
      rule.character = FactoryGirl.create(:character, level: 1, expirience: 1)
      rule.command = Command.new

      exp_was = rule.character.expirience

      rule.process
      rule.command.execute

      rule.character.expirience.should eq 3
    end

  end
end
