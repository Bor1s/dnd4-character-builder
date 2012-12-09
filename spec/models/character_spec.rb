require 'spec_helper'
require_relative "../shared/character/race.rb"

#require_relative "../shared/character/ability_scores.rb"
#require_relative "../shared/character/name.rb"
#require_relative "../shared/character/alignment.rb"
#require_relative "../shared/character/hit_points.rb"

describe Character do
  #subject { FactoryGirl.build(:dragonborn_character) }

  it 'basicaly initialized' do
    subject.should be
  end

  include_context "race"
  #include_context "ability scores"
  #include_context "name"
  #include_context "alignment"
  #include_context "hit points"

  #it 'has age' do
    #subject.should respond_to :age
  #end

  #it 'has gender' do
    #subject.should respond_to :gender
  #end

  #it 'has height' do
    #subject.should respond_to :height
  #end

  #it 'has weigth' do
    #subject.should respond_to :weight
  #end

  #it 'has background' do
    #subject.should respond_to :background
  #end

  #it 'has deity(ies)' do
    #subject.should respond_to :deities
  #end

  #it 'has language(s)' do
    #subject.should respond_to :languages
  #end

  #it 'has level' do
    #subject.should respond_to :level
  #end

  #it 'has expirience' do
    #subject.should respond_to :expirience
  #end

  #it 'has defences' do
    #subject.should respond_to :defences
  #end
end
