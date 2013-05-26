require 'spec_helper'

describe Rule do

  before :all do
    FactoryGirl.create(:simple_rule_abstract)
    FactoryGirl.create(:simple_rule_with_condition_rule_abstract)
    FactoryGirl.create(:simple_rule_with_bad_condition_rule_abstract)
    FactoryGirl.create(:test_character_expirience_rule_abstract)
  end

  it 'should respond to :name' do
    subject.should respond_to :name
  end

  it 'should respond to :todo' do
    subject.should respond_to :todo
  end

  it 'should respond to :character' do
    subject.should respond_to :character
  end

  it 'should respond_to :parse' do
    subject.protected_methods.grep(/parse/).should_not be_empty
  end

  context "#process" do

    it 'should raise exception if no character provided' do
      rule = Rule.where(name: "simple_rule_abstract").first
      rule.character = nil
      expect { rule.process }.to raise_exception(Rule::NoCharacterProvidedException)
    end

    it 'should raise FaultyRule if :what fails to be evaled' do
      rule = Rule.where(name: "faulty_rule").first
      rule.character = FactoryGirl.create(:character, level: 1, expirience: 1)
      expect { rule.process }.to raise_exception(Rule::FaultyRule)
    end

    it "should be success for simple rule" do
      rule = Rule.where(name: "simple_rule_abstract").first
      rule.character = FactoryGirl.create(:character, level: 1, expirience: 1)
      result = rule.process
      result.should eq 1
    end

    it "should be success for simple rule with condition" do
      rule = Rule.where(name: "simple_rule_with_condition_rule_abstract").first
      rule.character = FactoryGirl.create(:character, level: 1, expirience: 1)
      result = rule.process
      result.should eq 1
    end
    
    it "should fail for simple rule if condition failed" do
      rule = Rule.where(name: "simple_rule_with_bad_condition_rule_abstract").first
      rule.character = FactoryGirl.create(:character, level: 1, expirience: 1)
      expect { rule.process }.to raise_exception(Rule::ConditionFailed)
    end

    it "should be success for simple rule with storage" do
      rule = Rule.where(name: "test_character_expirience_rule_abstract").first
      rule.character = FactoryGirl.create(:character, level: 1, expirience: 1)

      exp_was = rule.character.expirience

      rule.process

      rule.character.expirience.should eq 3
    end

  end
end
