FactoryGirl.define do
  factory :character do
  end

  factory :dragonborn_character, parent: :character do
    character_race { FactoryGirl.build(:dragonborn) }
    character_class { FactoryGirl.build(:cleric) }
    name 'Trall'
    level 1
    expirience 900
  end
end
