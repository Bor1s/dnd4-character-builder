FactoryGirl.define do
  factory :rule do
  end
  
  # Hit points rules
  factory :hit_points_at_first_level_rule, parent: :rule do
    name :hit_points_at_first_level_rule
    todo [
      what: "{hit_points_at_first_level} + {constitution}",
      store_as: :hit_points
    ]

    root true
  end

  factory :general_hit_points_rule, parent: :rule do
    name :general_hit_points_rule
    todo [
      what: "{hit_points_per_level}",
      if: "{level} > 1",
      store_as: :hit_points
    ]

    root true
  end

  # Healing surges rules
  factory :healing_surges_rule, parent: :rule do
    name :healing_surges_rule
    todo [
      what: "{healing_surges_per_day} + {constitution_modifier}",
      store_as: :healing_surges
    ]

    root true
  end

  factory :healing_surge_value_rule, parent: :rule do
    name :healing_surge_value_rule
    todo [
      what: "{hit_points} / 4",
      store_as: :healing_surge_value
    ]

    root true
  end

  factory :bloodied_rule, parent: :rule do
    name :bloodied_rule
    todo [
      what: "{hit_points} / 2",
      store_as: :bloodied
    ]

    root true
  end

end
