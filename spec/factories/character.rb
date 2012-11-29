FactoryGirl.define do
  factory :character do
    ability_scores do
      abils = AbilityScoreGenerator.roll_ability_scores
      OpenStruct.new.tap do |abil|
        abil.strength = abils.pop
        abil.dexterity = abils.pop
        abil.constitution = abils.pop
        abil.wisdom = abils.pop
        abil.charisma = abils.pop
        abil.intelligence = abils.pop
      end
    end

    #Basic defences are eq 10
    defences do
      OpenStruct.new.tap do |defence|
        defence.armor_class = 10 
        defence.reflexes = 10
        defence.fortitude = 10
        defence.will = 10
      end
    end
  end

  factory :dragonborn_character, parent: :character do
    character_race { FactoryGirl.build(:dragonborn) }
    name 'Trall'
    alignment 'good'
    age 25
    height { self.character_race.height }
    weight { self.character_race.weight }
    gender :male
    background 'Foobar ...'
    deities ''
    languages []
    level 1
    expirience 900
    powers []
  end
end
