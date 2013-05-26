FactoryGirl.define do
  factory :strength_rule, parent: :rule do
    name :strength_rule
    todo Hash[
      what: "{strength} + 2",
      if: "{dragonborn?}",
      store_as: :strength,
    ]
    one_off true
  end

  factory :charisma_rule, parent: :rule do
    name :charisma_rule
    todo Hash[
      what: "{charisma} + 2",
      if: "{dragonborn?}",
      store_as: :charisma
    ]
    one_off true
  end

  factory :history_rule, parent: :rule do
    name :history_rule
    todo Hash[
      what: "{history} + 2",
      if: "{dragonborn?}",
      store_as: :history
    ]
    one_off true
  end

  factory :intimidate_rule, parent: :rule do
    name :intimidate_rule
    todo Hash[
      what: "{intimidate} + 2",
      if: "{dragonborn?}",
      store_as: :intimidate
    ]
    one_off true
  end

  factory :draconic_heritage_rule, parent: :rule do
    name :draconic_heritage_rule
    todo Hash[
      what: "{constitution_modifier}",
      if: "{dragonborn?}"
    ]
  end
  
  factory :dragon_breath_rule, parent: :rule do
    name :dragon_breath_rule
    todo Hash[
      what: "1",
      if: "{dragonborn?}"
    ]
    one_off true
  end

  #factory :dragonborn_languages_rule, parent: :rule do
    #name :dragonborn_languages_rule
    #todo Hash[
      #what: "{set_dragonborn_languages}",
      #if: "{dragonborn?} == true"
    #]

    #root true
  #end
  
end
