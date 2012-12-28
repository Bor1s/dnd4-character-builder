require 'spec_helper'
#require_relative "../shared/rules/hit_points_pool.rb"

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
  
  #context "performing rules for character" do
    #include_context "hit points, healing surges and bloodied value"
  #end
end
