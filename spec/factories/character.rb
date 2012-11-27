FactoryGirl.define do
  factory :character do
    ability_scores do
      ability_scores = AbilityScoreGenerator.roll_ability_scores
      OpenStruct.new(:strength, :dexterity, :constitution, :wisdom, :charisma, :intelligence).tap do |abil|
        abil.strength = ability_scores.pop
        abil.dexterity = ability_scores.pop
        abil.constitution = ability_scores.pop
        abil.wisdom = ability_scores.pop
        abil.charisma = ability_scores.pop
        abil.intelligence = ability_scores.pop
      end
    end

    #Basic defences are eq 10
    defences do
      OpenStruct.new(:armor_class, :reflexes, :fortitude, :will).tap do |defence|
        defence.armor_class = 10 
        defences.reflexes = 10
        defences.fortitude = 10
        defences.will = 10
      end
    end
  end

  factory :dragonborn_character, parent: :character do
    dragonborn
    name 'Trall'
    aligment 'good'
    age 25
    height { self.character_race.height }
    weight { self.character_race.weight }
    gender :male
    background 'Foobar ...'
    deity ''
    languages []
    level 1
    expirience 900
    powers []
  end
end
