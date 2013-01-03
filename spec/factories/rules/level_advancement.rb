FactoryGirl.define do
  factory :first_level_advancement_rule, parent: :rule do
    name :first_level_advancement_rule
    todo [
      {
        what: "{atwill_powers_known} + 1", 
        store_as: :atwill_powers_known,
        if: "{level} == 1"
      },
      {
        what: "{encounter_powers_known} + 1", 
        store_as: :encounter_powers_known,
        if: "{level} == 1"
      },
      {
        what: "{daily_powers_known} + 1", 
        store_as: :daily_powers_known,
        if: "{level} == 1"
      },
      {
        what: "{feats_known} + 1", 
        store_as: :feats_known,
        if: "{level} == 1"
      }
    ]

    root true
  end
  
  factory :hit_points_increasing_rule, parent: :rule do
    name :hit_points_increasing_rule
    todo [
      what: "{hit_points} + 1",
      store_as: :hit_points,
      if: "{level} > 1 and {constitution_increased?}"
    ]

    root true
  end
end
