FactoryGirl.define do
  factory :atwills_known_at_first_level_rule, parent: :rule do
    name :atwills_known_at_first_level_rule
    todo Hash[
      what: "{atwill_powers_known} + 1", 
      store_as: :atwill_powers_known,
      if: "{level} == 1"
    ]
    root true
  end
  
  factory :encounters_known_at_first_level_rule, parent: :rule do
    name :encounters_known_at_first_level_rule
    todo Hash[
      what: "{encounter_powers_known} + 1", 
      store_as: :encounter_powers_known,
      if: "{level} == 1"
    ]
    root true
  end
  
  factory :dailies_known_at_first_level_rule, parent: :rule do
    name :dailies_known_at_first_level_rule
    todo Hash[
      what: "{daily_powers_known} + 1", 
      store_as: :daily_powers_known,
      if: "{level} == 1"
    ]
    root true
  end

  factory :feats_known_at_first_level_rule, parent: :rule do
    name :feats_known_at_first_level_rule
    todo Hash[
      what: "{feats_known} + 1", 
      store_as: :feats_known,
      if: "{level} == 1"
    ]
    root true
  end

  factory :hit_points_increasing_rule, parent: :rule do
    name :hit_points_increasing_rule
    todo Hash[
      what: "{hit_points} + 1",
      store_as: :hit_points,
      if: "{level} > 1 and {constitution_increased?}"
    ]

    root true
  end
end
