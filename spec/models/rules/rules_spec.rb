require 'spec_helper'

describe Rule do

  it 'should respond to :name' do
    subject.should respond_to :name
  end

  it 'should respond to :performs' do
    subject.should respond_to :name
  end

  it 'should respond to :as_soon_as' do
    subject.should respond_to :name
  end

  it 'should respond to :character' do
    subject.should respond_to :character
  end

  context "abstract rule's'"do

    before :all do
      FactoryGirl.create(:hit_points_rule)
      FactoryGirl.create(:hit_points_by_level_rule)
      FactoryGirl.create(:start_hit_points_rule)
    end

    it 'should respond_to :parse_as_soon_as' do
      subject.should respond_to :parse_performs
    end

    it 'as_soon_as should be parsed' do
      dragonborn_character = FactoryGirl.build(:dragonborn_character)
      subject.character = dragonborn_character

      subject.stub( as_soon_as: [ { level: { more_then: 20 } } ])
      subject.send(:parse_as_soon_as).should be_false

      subject.stub( as_soon_as: [ { level: { is: 1 } } ])
      subject.send(:parse_as_soon_as).should be_true

      subject.stub( as_soon_as: [ { level: { any_of: [1,2,3] } } ])
      subject.send(:parse_as_soon_as).should be_true
    end

    it 'should respond to :parse_performs' do
      subject.should respond_to :parse_performs
    end

    it 'performs should be parsed with plain value(s)' do
      subject.stub(:performs => { what: [1, 2], how: :+ })
      subject.send(:parse_performs).should eq 3

      subject.stub(:performs => { what: 1 })
      subject.send(:parse_performs).should eq 1
    end

    it 'should be parsed with Symbol value(s)' do
      dragonborn_character = FactoryGirl.build(:dragonborn_character)
      subject.character = dragonborn_character

      subject.stub(:performs => { what: :level })
      subject.send(:parse_performs).should eq subject.character.level

      subject.stub(:performs => { what: [:level, :expirience], how: :+ })
      subject.send(:parse_performs).should eq(subject.character.level + subject.character.expirience)
    end

    it 'should be parsed with Symbol value and _rule suffics' do

      #TODO: Create CharacterClass factory
      dragonborn_character = FactoryGirl.build(:dragonborn_character)
      subject.character = dragonborn_character

      subject.stub(:performs => { what: :hit_points_rule })

      expected_result = dragonborn_character.constitution + dragonborn_character.basic_hit_points
      subject.send(:parse_performs).should eq expected_result
    end
  end

end
