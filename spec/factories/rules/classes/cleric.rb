FactoryGirl.define do
  #This is Channel divinity: Divine Fortune, Turn Undead and Healing Word encounters
  factory :cleric_encounter_powers_known_rule, parent: :rule do
    name :cleric_encounter_powers_known_rule
    todo Hash[
      what: "{encounter_powers_known} + 3",
      if: "{cleric?}",
      store_as: :encounter_powers_known
    ]
  end

  factory :healers_lore_rule, parent: :rule do
    name :healers_lore_rule
    todo Hash[
      what: "{wisdom_modifier}",
      if: "{cleric?}",
      store_as: :healing_keyword_bonus
    ]
  end

end
