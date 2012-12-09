# --- Character races

FactoryGirl.define do
  factory :character_race do
  end

  factory :dragonborn, parent: :character_race do
    name "Dragonborn"
    description "Proud, honorable warriors, born from the blood of an ancient dragon god"
    #height (6.2..6.8) # Feet
    #weight (220..320) # Lbs.
    #ability_scores_bonuses Hash.new({ str: 2, cha: 2 })
    #size :medium
    #vision :normal
    #speed 6
    #languages [:common_language, :draconic] #has_many :languages
    #skill_bonuses Hash.new({ history: 2, intimidate: 2 })

    #racial_traits [
      #{ name: "Dragonborn Fury", 
        #description: "When you're bloodied, you gain a +1 racial bonus to attack rolls.",
        #keyword: :info,
        #bonus: 0
      #},
      #{ name: "Draconic Heritage", 
        #description: "Your healing surge value is equal to one-quarter of your maximum hit points + your Constitution modifier.",
        #keyword: :healing_surge_value,
        #bonus: "->(){ character.ability_scores.constitution_modifier }"
      #},
      #{
        #name: "Dragon Breath",
        #description: "You can use Dragon Breath as an encounter power.",
        #keyword: "racial_powers",
        #bonus: 0
      #}
    #]
  end

  factory :dwarf, parent: :character_race do
    name "Dwarf"
    description "Masters of stone and iron, dauntless and unyielding in the face of adversity"
    #height (4.3..4.9) # Feet
    #weight (160..220) # Lbs.
    #ability_scores_bonuses Hash.new({ con: 2, wis: 2 })
    #size :medium
    #vision :low_light
    #speed 5
    ##languages [common_language, draconic]
    #skill_bonuses Hash.new({ dungeoneering: 2, endurance: 2 })

    #TODO set racial traits from PH
    #racial_traits []
  end
end
