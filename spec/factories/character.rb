FactoryGirl.define do
  factory :character do
  end

  factory :dragonborn_character, parent: :character do
    after(:create) do |char, evaluator|
      FactoryGirl.create(:dragonborn, character: char)
      FactoryGirl.create(:cleric, character: char)
      char.skills = [
	  		FactoryGirl.create(:history),
	  		FactoryGirl.create(:intimidate)
      ]
    end

    name 'Trall'
    level 1
    expirience 900
  end
end
