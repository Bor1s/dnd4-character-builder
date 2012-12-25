FactoryGirl.define do
  factory :rule do
  end
  
  #performs:
    #Assums that character should respond_to :name_wirhout_RULE_suffics setter methods to store result
    #what: Array or symbol. #:method taken from character adapter that responds to this method.
      #if :symbol ends with _rule - lookup in rules table.   
    #how (optional) how to concat array (+, -, /, * etc.)

  #as_soon_as (optional):
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

    #value types: String (plain value to match),
    # Symbol (engage methods lookup in character class or rule lookup in _rule suffics present),
    # Integer (plain value to match)
  
  # Abstract rules
  factory :foobar_rule, parent: :rule do
    name :foobar_rule
    performs Hash[
      what: 1
    ]
  end
  
  factory :barbaz_rule, parent: :rule do
    name :barbaz_rule
    performs Hash[
      what: 2
    ]
  end

  factory :some_rule, parent: :rule do
    name :some_rule
    performs Hash[
      what: 7
    ]
    root true
  end

  # Hit points rules
  factory :hit_points_by_level_rule, parent: :rule do
    name :hit_points_by_level_rule
    performs Hash[
      what: :per_level_hit_points
    ] 
    as_soon_as [
      level: { more_then: 1 }
    ]
  end

  factory :start_hit_points_rule, parent: :rule do
    name :start_hit_points_rule
    performs Hash[ 
      what: [:hit_points_at_first_level, :constitution],
      how: :+
    ]
  end

  factory :hit_points_rule, parent: :rule do
    name :hit_points_rule
    performs Hash[
      what: [:hit_points_by_level_rule, :start_hit_points_rule],
      how: :+ 
    ]
    root true
  end

  # Healing surges rules
  factory :healing_surges_rule, parent: :rule do
    name :healing_surges_rule
    performs Hash[ 
      what: [:healing_surges_per_day, :constitution_modifier],
      how: :+
    ]
    root true
  end

  factory :healing_surge_value_rule, parent: :rule do
    name :healing_surge_value_rule
    performs Hash[ 
      what: [:hit_points, 4],
      how: :/
    ]
    root true
  end

  factory :bloodied_rule, parent: :rule do
    name :bloodied_rule
    performs Hash[ 
      what: [:hit_points, 2],
      how: :/
    ]
    root true
  end

  # Dragonborn race
  # NOTE rename rules and add store_to
  factory :strength_rule, parent: :rule do
    name :strength_rule
    performs Hash[
      what: [:strength, 2],
      how: :+
    ]
    as_soon_as [
      race: { is: "dragonborn" }
    ]
    root true
  end

  factory :charisma_rule, parent: :rule do
    name :charisma_rule
    performs Hash[
      what: [:charisma, 2],
      how: :+
    ]
    as_soon_as [
      race: { is: "dragonborn" }
    ]
    root true
  end

  factory :trained_history_rule, parent: :rule do
    name :trained_history_rule
    performs Hash[
      what: [:history, 5],
      how: :+
    ]
    as_soon_as [
      history_trained?: { is: true }
    ]
  end

  factory :history_rule, parent: :rule do
    name :history_rule
    performs Hash[
      what: [:history, 2, :trained_history_rule],
      how: :+
    ]
    as_soon_as [
      race: { is: "dragonborn" }
    ]
    root true
  end

  factory :trained_intimidate_rule, parent: :rule do
    name :trained_intimidate_rule
    performs Hash[
      what: [:intimidate, 5],
      how: :+
    ]
    as_soon_as [
      intimidate_trained?: { is: true }
    ]
  end

  factory :intimidate_rule, parent: :rule do
    name :intimidate_rule
    performs Hash[
      what: [:intimidate, 2, :trained_intimidate_rule],
      how: :+
    ]
    as_soon_as [
      race: { is: "dragonborn" }
    ]
    root true
  end

  factory :draconic_heritage_rule, parent: :rule do
    name :draconic_heritage_rule
    store_to :healing_surge_value
    performs Hash[
      what: [:healing_surge_value, :constitution_modifier],
      how: :+
    ]
    as_soon_as [
      race: { is: "dragonborn" }
    ]
    root true
  end
end
