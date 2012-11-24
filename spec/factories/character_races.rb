# --- Character races

FactoryGirl.define do
  factory :character_race do
  end

  factory :dragonborn, parent: :character_race do
    name "Dragonborn"
    description "Proud, honorable warriors, born from the blood of an ancient dragon god"
    avg_height (6.2..6.8) # Feet
    avg_weight (220..320) # Lbs.
    ability_scores_bonuses Hash.new({ str: 2, cha: 2 })
    size :medium
    vision :normal
    speed 6
    #languages [common_language, draconic]
    skill_bonuses Hash.new({ history: 2, intimidate: 2 })

    #TODO maybe make racial_traits a separate class.
    traits [
      { name: "Dragonborn Fury", 
        description: "When you're bloodied, you gain a +1 racial bonus to attack rolls.",
        keyword: "info",
        bonus: nil
      },
      { name: "Draconic Heritage", 
        description: "Your healing surge value is equal to one-quarter of your maximum hit points + your Constitution modifier.",
        keyword: "healing_surge_value",
        bonus: ->(){ ability_scores.constitution_modifier }
      },
      {
        # TODO implement powers and racial powers
        name: "Dragon Breath",
        description: "You can use Dragon Breath as an encounter power.",
        keyword: "racial_powers"
      }
    ]
    powers ""
  end

  factory :dwarf, parent: :character_race do
    name "Dwarf"
    description "Masters of stone and iron, dauntless and unyielding in the face of adversity"
  end
end
