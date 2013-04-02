FactoryGirl.define do
  factory :rule do
  end
  
  # Hit points rules
  factory :hit_points_rule, parent: :rule do
    name :hit_points_rule
    todo Hash[
      what: "{hit_points_at_first_level} + {constitution} + {hit_points_per_level} * {level_multiplier}",
      store_as: :hit_points
    ]
  end

  # Healing surges rules
  factory :healing_surges_rule, parent: :rule do
    name :healing_surges_rule
    todo Hash[
      what: "{healing_surges_per_day} + {constitution_modifier}",
      store_as: :healing_surges
    ]
  end

  factory :healing_surge_value_rule, parent: :rule do
    name :healing_surge_value_rule
    todo Hash[
      what: "{healing_surge_value} + {hit_points} / 4",
      store_as: :healing_surge_value
    ]
  end

  factory :bloodied_rule, parent: :rule do
    name :bloodied_rule
    todo Hash[
      what: "{hit_points} / 2",
      store_as: :bloodied
    ]
  end

  factory :hit_points_increasing_rule, parent: :rule do
    name :hit_points_increasing_rule
    todo Hash[
      what: "{hit_points} + 1",
      store_as: :hit_points,
      if: "{constitution_increased?}"
    ]
  end

  factory :healing_surges_increasing_rule, parent: :rule do
    name :healing_surges_increasing_rule
    todo Hash[
      what: "{healing_surges} + 1",
      store_as: :healing_surges,
      if: "{constitution_increased_to_even?}"
    ]
  end

end
