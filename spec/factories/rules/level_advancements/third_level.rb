FactoryGirl.define do
  factory :utilities_known_at_third_level_rule, parent: :rule do
    name :utilities_known_at_third_level_rule
    todo Hash[
      what: "{utility_powers_known} + 1", 
      store_as: :utility_powers_known,
      if: "{level} == 3"
    ]
    root true
  end

  factory :feats_known_at_third_level_rule, parent: :rule do
    name :feats_known_at_third_level_rule
    todo Hash[
      what: "{feats_known} + 2", 
      store_as: :feats_known,
      if: "{level} == 3"
    ]
    root true
  end

  factory :atwills_known_at_third_level_rule, parent: :rule do
    name :atwills_known_at_third_level_rule
    todo Hash[
      what: "{atwill_powers_known} + 2", 
      store_as: :atwill_powers_known,
      if: "{level} == 3"
    ]
    root true
  end
  
  factory :encounters_known_at_third_level_rule, parent: :rule do
    name :encounters_known_at_third_level_rule
    todo Hash[
      what: "{encounter_powers_known} + 2", 
      store_as: :encounter_powers_known,
      if: "{level} == 3"
    ]
    root true
  end
  
  factory :dailies_known_at_third_level_rule, parent: :rule do
    name :dailies_known_at_third_level_rule
    todo Hash[
      what: "{daily_powers_known} + 1", 
      store_as: :daily_powers_known,
      if: "{level} == 3"
    ]
    root true
  end

end
