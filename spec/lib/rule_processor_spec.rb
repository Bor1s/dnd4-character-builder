require 'spec_helper'
require_relative "../shared/rules/healing_surges.rb"
require_relative "../shared/rules/hit_points.rb"

describe RuleProcessor do
  subject { RuleProcessor.new(FactoryGirl.build(:dragonborn_character)) }

  it 'should respond_to :character' do
    subject.should respond_to :character
  end
  
  context "performing rules for character" do
    include_context "hit points"
    include_context "healing surges"
  end

end
