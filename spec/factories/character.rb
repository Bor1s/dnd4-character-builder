FactoryGirl.define do
  factory :character do
    after(:create, :build) do |char, evaluator|
      char.ability_scores = [
        FactoryGirl.create(:strength, character: char),
	  		FactoryGirl.create(:dexterity, character: char),
	  		FactoryGirl.create(:constitution, character: char),
	  		FactoryGirl.create(:wisdom, character: char),
	  		FactoryGirl.create(:intelligence, character: char),
	  		FactoryGirl.create(:charisma, character: char)
      ]

      char.skills = [
	  		FactoryGirl.create(:history, characters: [char]),
	  		FactoryGirl.create(:intimidate, characters: [char])
      ]
    end
  end

  factory :dragonborn_character, parent: :character do
    association :character_race, factory: :dragonborn
    association :character_class, factory: :cleric

    name 'Trall'
    level 1
    expirience 900
  end
end
