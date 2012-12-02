  #factory :healing_surges, parent: :rule do
    #name :healing_surges
    #formula "->() do
      #character_class.healing_surges_per_day + ability_scores.constitution_modifier
    #end"
  #end

  #factory :healing_surge_value, parent: :rule do
    #name :healing_surge_value
    #formula "->(){ hit_points / 4 }"
  #end

  #factory :bloodied_value, parent: :rule do
    #name :bloodied_value
    #formula "->(){ hit_points / 2 }"
  #end

FactoryGirl.define do
  factory :rule do
  end
  
  #performs:
    #what: Array or symbol. #:method taken from character adapter that responds to this method.
      #if :symbol ends with _rule - lookup in rules table.   
    #how (optional) how to concat array (+, -, /, * etc.)

  #as_soon_as:  ##Optional
    #Array of conditions. By default they merges with logical AND.

    #level: { more_then: 20 } #character should respond_to :level
    #level: { more_then_or_equal: 20 }
    #level: { less_then: 20 }
    #level: { less_then_or_equal: 20 }
    #level: { equal: 20 }
    #level: { between: 20..40 }
    #level: { is_not: 20..40 }
    #level: { is: 20 }
    #level: { any_in: 20 }
    #level: { all_in: 20 }


  factory :hit_points_by_level_rule, parent: :rule do
    name :hit_points_by_level_rule
    performs Hash.new[
      what: :per_level_hit_points
    ] 
    as_soon_as [
      level: { more_then: 1 }
    ]
  end

  factory :start_hit_points_rule, parent: :rule do
    name :start_hit_points_rule
    performs Hash[ 
      what: [:basic_hit_points, :constitution],
      how: :+
    ]
  end

  factory :hit_points_rule, parent: :rule do
    name :hit_points_rule
    performs Hash[
      what: [:hit_points_by_level_rule, :start_hit_points_rule],
      how: :+ 
    ]
  end
end
