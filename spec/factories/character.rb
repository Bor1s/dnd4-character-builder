FactoryGirl.define do
  factory :character do
    factory :dragonborn_cleric, parent: :character do
      before(:create) do |char, evaluator|
        char.character_race = FactoryGirl.build(:dragonborn)
        char.character_class = FactoryGirl.build(:cleric)
        [
          FactoryGirl.build(:acrobatics),
          FactoryGirl.build(:arcana),
          FactoryGirl.build(:athletics),
          FactoryGirl.build(:bluff),
          FactoryGirl.build(:diplomacy),
          FactoryGirl.build(:dungeoneering),
          FactoryGirl.build(:endurance),
          FactoryGirl.build(:heal),
          FactoryGirl.build(:history),
          FactoryGirl.build(:insight),
          FactoryGirl.build(:intimidate),
          FactoryGirl.build(:nature),
          FactoryGirl.build(:perception),
          FactoryGirl.build(:religion),
          FactoryGirl.build(:stealth),
          FactoryGirl.build(:streetwise),
          FactoryGirl.build(:thievery)
        ].each do |skil|
          char.skills << skil
        end

        char.languages << FactoryGirl.build(:common_language)
        char.languages << FactoryGirl.build(:draconic_language)
      end

      name 'Trall'
      level 1
      expirience 900
    end
  end
end
