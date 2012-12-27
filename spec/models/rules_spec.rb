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
    subject { FactoryGirl.create(:test_character_expirience_rule) }

    before do
      subject.character = FactoryGirl.create(:character, level: 1, expirience: 1)
    end

    it "should be success on simple rule" do
      exp_was = subject.character.expirience

      subject.process
      subject.character.expirience.should eq 3
    end

    it 'should raise exception if no character provided' do
      subject.character = nil
      expect { subject.process }.to raise_exception(Rule::NoCharacterProvidedException)
    end
  end
end
