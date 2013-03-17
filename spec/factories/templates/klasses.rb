FactoryGirl.define do
  factory :klass, class: Templates::Klass do
  end
  
  factory :cleric_template, parent: :klass do
    name "Cleric"
    hit_points_at_first_level 12
    hit_points_per_level 5
    healing_surges_per_day 7
    trained_skills_count 4
    mandatory_trained_skills [:religion]
  end
end
