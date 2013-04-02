FactoryGirl.define do
  factory :atwills_known_at_first_level_rule, parent: :rule do
    name :atwills_known_at_first_level_rule
    todo Hash[
      what: "{atwill_powers_known} + 1", 
      store_as: :atwill_powers_known,
      if: "{level} == 1"
    ]
  end
  
  factory :encounters_known_at_first_level_rule, parent: :rule do
    name :encounters_known_at_first_level_rule
    todo Hash[
      what: "{encounter_powers_known} + 1", 
      store_as: :encounter_powers_known,
      if: "{level} == 1"
    ]
  end
  
  factory :dailies_known_at_first_level_rule, parent: :rule do
    name :dailies_known_at_first_level_rule
    todo Hash[
      what: "{daily_powers_known} + 1", 
      store_as: :daily_powers_known,
      if: "{level} == 1"
    ]
  end

  factory :feats_known_at_first_level_rule, parent: :rule do
    name :feats_known_at_first_level_rule
    todo Hash[
      what: "{feats_known} + 1", 
      store_as: :feats_known,
      if: "{level} == 1"
    ]
  end

end
