FactoryGirl.define do
  # --- 6 character ability scores: Str, Con, Dex, Int, Wis, Cha
  factory :ability_score do

    factory :strength do
      name "strength"
      value 0
    end

    factory :constitution do
      name "constitution"
      value 0
    end

    factory :dexterity do
      name "dexterity"
      value 0
    end

    factory :intelligence do
      name "intelligence"
      value 0
    end

    factory :wisdom do
      name "wisdom"
      value 0
    end

    factory :charisma do
      name "charisma"
      value 0
    end

  end

  # --------------- Modificators ----------------

  # Ability Score   Ability Modificator
  # 1               -5
  # 2-3             -4
  # 4-5             -3
  # 6-7             -2
  # 8-9             -1
  # 10-11           0
  # 12-13           +1
  # 14-15           +2
  # ...
  # Formula: ability_score - (ability_score / 2) - 5 ( - 1 if odd)
end
