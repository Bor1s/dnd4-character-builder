FactoryGirl.define do
  factory :character do
    after(:create, :build) do |char, evaluator|
      char.strength = 0
      char.charisma = 0
      char.dexterity = 0
      char.wisdom = 0
      char.intelligence = 0
      char.constitution = 0

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
