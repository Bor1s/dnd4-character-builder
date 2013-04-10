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

  factory :turn_undead_burst_squares_first_lvl_rule, parent: :rule do
    name :turn_undead_burst_squares_first_lvl_rule
    todo Hash[
      what: "2",
      if: "{cleric?} and {level} == 1",
      store_as: :turn_undead_burst_squares
    ]
  end

  factory :turn_undead_burst_squares_eleven_lvl_rule, parent: :rule do
    name :turn_undead_burst_squares_eleven_lvl_rule
    todo Hash[
      what: "5",
      if: "{cleric?} and {level} == 11",
      store_as: :turn_undead_burst_squares
    ]
  end

  factory :turn_undead_burst_squares_twfirst_lvl_rule, parent: :rule do
    name :turn_undead_burst_squares_twfirst_lvl_rule
    todo Hash[
      what: "8",
      if: "{cleric?} and {level} == 21",
      store_as: :turn_undead_burst_squares
    ]
  end

  factory :turn_undead_dice_amount_first_lvl_rule, parent: :rule do
    name :turn_undead_dice_amount_first_lvl_rule
    todo Hash[
      what: "1",
      if: "{cleric?} and {level} == 1",
      store_as: :turn_undead_dice_amount
    ]
  end

  factory :turn_undead_dice_amount_fifth_lvl_rule, parent: :rule do
    name :turn_undead_dice_amount_fifth_lvl_rule
    todo Hash[
      what: "2",
      if: "{cleric?} and {level} == 5",
      store_as: :turn_undead_dice_amount
    ]
  end

  factory :turn_undead_dice_amount_eleventh_lvl_rule, parent: :rule do
    name :turn_undead_dice_amount_eleventh_lvl_rule
    todo Hash[
      what: "3",
      if: "{cleric?} and {level} == 11",
      store_as: :turn_undead_dice_amount
    ]
  end

  factory :turn_undead_dice_amount_fifteenth_lvl_rule, parent: :rule do
    name :turn_undead_dice_amount_fifteenth_lvl_rule
    todo Hash[
      what: "4",
      if: "{cleric?} and {level} == 15",
      store_as: :turn_undead_dice_amount
    ]
  end

  factory :turn_undead_dice_amount_twfirst_lvl_rule, parent: :rule do
    name :turn_undead_dice_amount_twfirst_lvl_rule
    todo Hash[
      what: "5",
      if: "{cleric?} and {level} == 21",
      store_as: :turn_undead_dice_amount
    ]
  end

  factory :turn_undead_dice_amount_twfifth_lvl_rule, parent: :rule do
    name :turn_undead_dice_amount_twfifth_lvl_rule
    todo Hash[
      what: "6",
      if: "{cleric?} and {level} == 25",
      store_as: :turn_undead_dice_amount
    ]
  end
end
