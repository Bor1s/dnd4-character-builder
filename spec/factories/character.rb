FactoryGirl.define do
  factory :character do
  end

  factory :dragonborn_character, parent: :character do
    before(:create) do |char, evaluator|
      char.character_race = FactoryGirl.build(:dragonborn)
      char.character_class = FactoryGirl.build(:cleric)
      char.skills << FactoryGirl.build(:history)
      char.skills << FactoryGirl.build(:intimidate)
      char.languages << FactoryGirl.build(:common_language)
      char.languages << FactoryGirl.build(:draconic_language)
    end

    name 'Trall'
    level 1
    expirience 900
  end
end
