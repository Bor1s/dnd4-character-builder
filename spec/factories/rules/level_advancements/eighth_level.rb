FactoryGirl.define do
  factory :utilities_known_at_eighth_level_rule, parent: :rule do
    name :utilities_known_at_eighth_level_rule
    todo Hash[
      what: "2",
      store_as: :utility_powers_known,
      if: "{level} == 8"
    ]
    one_off true
  end

  factory :feats_known_at_eighth_level_rule, parent: :rule do
    name :feats_known_at_eighth_level_rule
    todo Hash[
      what: "5",
      store_as: :feats_known,
      if: "{level} == 8"
    ]
    one_off true
  end

  factory :atwills_known_at_eighth_level_rule, parent: :rule do
    name :atwills_known_at_eighth_level_rule
    todo Hash[
      what: "2",
      store_as: :atwill_powers_known,
      if: "{level} == 8"
    ]
    one_off true
  end
  
  factory :encounters_known_at_eighth_level_rule, parent: :rule do
    name :encounters_known_at_eighth_level_rule
    todo Hash[
      what: "{cleric_encounter_powers_known_rule} + {dragon_breath_rule} + 3",
      store_as: :encounter_powers_known,
      if: "{level} == 8"
    ]
    one_off true
  end
  
  factory :dailies_known_at_eighth_level_rule, parent: :rule do
    name :dailies_known_at_eighth_level_rule
    todo Hash[
      what: "2",
      store_as: :daily_powers_known,
      if: "{level} == 8"
    ]
    one_off true
  end

  factory :ability_scores_upgrade_points_at_eighth_level_rule, parent: :rule do
    name :ability_scores_upgrade_points_at_eighth_level_rule
    todo Hash[
      what: "2",
      store_as: :ability_scores_upgrade_points,
      if: "{level} == 8"
    ]
  end

end
