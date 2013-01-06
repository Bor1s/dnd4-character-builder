require 'spec_helper'

describe RuleProcessor do
	subject do
		character = FactoryGirl.create(:character, level: 1)
		RuleProcessor.new(character)
 	end

  it 'should respond_to :character' do
    subject.should respond_to :character
  end

  it 'should process rules' do
    FactoryGirl.create(:test_character_expirience_rule)
    subject.process
    subject.character.expirience.should eq 2
  end
end
