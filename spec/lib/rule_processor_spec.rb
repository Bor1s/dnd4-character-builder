require 'spec_helper'
require_relative "../shared/rules/hit_points_pool.rb"

describe RuleProcessor do
	subject do
		dr = FactoryGirl.create(:dragonborn_character)
		dr.tap do |c|
			c.ability_scores = [FactoryGirl.create(:constitution, value: 14, character: dr)]
		end
		RuleProcessor.new(dr)
 	end

  it 'should respond_to :character' do
    subject.should respond_to :character
  end
  
  context "performing rules for character" do
    include_context "hit points, healing surges and bloodied value"
  end
end
