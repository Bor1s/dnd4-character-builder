FactoryGirl.define do
  factory :character do
    factory :dragonborn, parent: :character do
      before(:create) do |char, evaluator|
        char.race = FactoryGirl.build(:dragonborn_race)
      end
    end

    factory :dragonborn_cleric, parent: :character do
      before(:create) do |char, evaluator|
        char.race = FactoryGirl.build(:dragonborn_race)
        char.character_class = FactoryGirl.build(:cleric)
      end

      name 'Trall'
      level 1
      expirience 900
    end
  end
end
