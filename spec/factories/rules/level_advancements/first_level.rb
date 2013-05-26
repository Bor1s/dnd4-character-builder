FactoryGirl.define do
  factory :atwills_known_at_first_level_rule, parent: :rule do
    name :atwills_known_at_first_level_rule
    todo Hash[
      what: "2",
      store_as: :atwill_powers_known,
      if: "{level} == 1"
    ]
    one_off true
  end
  
  factory :encounters_known_at_first_level_rule, parent: :rule do
    name :encounters_known_at_first_level_rule
    todo Hash[
      what: "1 + {cleric_encounter_powers_known_rule} + {dragon_breath_rule}",
      store_as: :encounter_powers_known,
      if: "{level} == 1"
    ]
    one_off true
  end
  
  factory :dailies_known_at_first_level_rule, parent: :rule do
    name :dailies_known_at_first_level_rule
    todo Hash[
      what: "1",
      store_as: :daily_powers_known,
      if: "{level} == 1"
    ]
    one_off true
  end

  factory :feats_known_at_first_level_rule, parent: :rule do
    name :feats_known_at_first_level_rule
    todo Hash[
      what: "1",
      store_as: :feats_known,
      if: "{level} == 1"
    ]
    one_off true
  end

end
