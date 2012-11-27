FactoryGirl.define do
  factory :semantic_rule do
  end
  
  factory :semantic_hit_points, parent: :semantic_rule do
    name :semantic_hit_points
    actions Hash.new( 
      left: { left: :character_class_basic_hit_points, #take from character class
              right: :ability_scores_constitution, #take from character ability scores
              operator: :+
      },
      right: :semantic_hit_points_by_level, #take from character class
      operator: :+
    )
  end
  
  factory :semantic_hit_points_by_level, parent: :semantic_rule do
    name :semantic_hit_points_by_level
    actions Hash.new({
      single: :character_class_per_level_hit_points, #take from character class 
    })
    conditions Hash.new({
      left: :level, #take from character
      right: 0,
      operator: :>
    })
  end
end
