FactoryGirl.define do
  factory :rule do
  end

  factory :hit_points, parent: :rule do
    name :hit_points
    formula "->() do
      character_class.basic_hit_points +
        (level == 1 ? 0 : character_class.per_level_hit_points) +
          ability_scores.constitution
    end"
  end

  factory :healing_surges_number, parent: :rule do
    name :healing_surges_number
    formula "->() do
      character_class.healing_surges_per_day + ability_scores.constitution_modifier
    end"
  end

  factory :healing_surge_value, parent: :rule do
    name :healing_surge_value
    formula "->(){ hit_points / 4 }"
  end

  factory :bloodied_value, parent: :rule do
    name :bloodied_value
    formula "->(){ hit_points / 2 }"
  end
end
