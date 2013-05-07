FactoryGirl.define do
  factory :rule do

    # Hit points rules
    factory :hit_points_rule do
      name :hit_points_rule
      todo Hash[
        what: "{hit_points_at_first_level} + {constitution} + {hit_points_per_level} * {level_multiplier}",
        store_as: :hit_points
      ]
    end

    # Healing surges rules
    factory :healing_surges_rule do
      name :healing_surges_rule
      todo Hash[
        what: "{healing_surges_per_day} + {constitution_modifier}",
        store_as: :healing_surges
      ]
    end

    factory :healing_surge_value_rule do
      name :healing_surge_value_rule
      todo Hash[
        what: "{hit_points} / 4 + {draconic_heritage_rule}",
        store_as: :healing_surge_value
      ]
    end

    factory :bloodied_rule do
      name :bloodied_rule
      todo Hash[
        what: "{hit_points} / 2",
        store_as: :bloodied
      ]
    end

    factory :hit_points_increasing_rule do
      name :hit_points_increasing_rule
      todo Hash[
        what: "{hit_points} + 1",
        store_as: :hit_points,
        if: "{constitution_increased?}"
      ]
    end

    factory :healing_surges_increasing_rule do
      name :healing_surges_increasing_rule
      todo Hash[
        what: "{healing_surges} + 1",
        store_as: :healing_surges,
        if: "{constitution_increased_to_even?}"
      ]
    end

    factory :fort_rule do
      name :fort_rule
      todo Hash[
        what: "10 + {level} / 2 + [{strength_modifier}, {constitution_modifier}].max",
        store_as: :fortitude
      ]
    end

    factory :lightweight_ac_rule do
      name :lightweight_ac_rule
      todo Hash[
        what: "10 + {level} / 2 + [{dexterity_modifier}, {intelligence_modifier}].max",
        store_as: :armor_class,
        if: "{has_lightweight_armor?}"
      ]
    end

    #factory :heavy_ac_rule do
      #todo Hash[
        #what: "10 + level / 2 + {total_armor_bonus}",
        #store_as: :ac,
        #if: "{has_lightweight_armor?}"
      #]
    #end

    factory :ref_rule do
      name :ref_rule
      todo Hash[
        what: "10 + {level} / 2 + [{dexterity_modifier}, {intelligence_modifier}].max",
        store_as: :reflex
      ]
    end

    factory :will_rule do
      name :will_rule
      todo Hash[
        what: "10 + {level} / 2 + [{wisdom_modifier}, {charisma_modifier}].max",
        store_as: :will
      ]
    end

  end
end
