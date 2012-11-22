# --- Ability scores and their level modificators

FactoryGirl.define do

  # --- 6 character ability scores: Str, Con, Dex, Int, Wis, Cha

  factory :ability_score do
  end

  factory :strength, parent: :ability_score do
    name "Strength"
    short_name "Str"
    title "Measures your character's physical power. It's important for most characters who fight hand-to-hand"
    description ["Melee basic attacks are based on Strength.",
      "Clerics, fighters, paladins, rangers, and warlords have powers based on Strength.",
      "Your Strength might contribute to your Fortitude defense.",
      "Strength is the key ability for Athletics skill checks."]
  end

  factory :constitution, parent: :ability_score do
    name "Constitution"
    short_name "Con"
    title "Represents your character's health, stamina, and vital force. All characters benefia from a high Constitution score."
    description ["Your Constitution score is added to your hit points at 1st level.",
      "The number of healing surges you can use each day is influenced by your Constitution.",
      "Many warlock powers are based on Constitution.",
      "Your Constitution might contribute to your Fortitude defense.",
      "Constitution is the key ability for Endurance skill checks."]
  end

  factory :dexterity, parent: :ability_score do
    name "Dexterity"
    short_name "Dex"
    title "Measures hand-eye coordination, agility, reflexes, and balance."
    description ["Ranged basic attacks are based on Dexterity.",
      "Many ranger and rogue powers are based on Dexterity.",
      "Your Dexterity might contribute to your Reflex defense.",
      "If you wear light armor, your Dexterity might contribute to your Armor Class.",
      "Dexterity is the key ability for Acrobatics, Stealth, and Thievery skill checks."]
  end

  factory :intelligence, parent: :ability_score do
    name "Intelligence"
    short_name "Int"
    title "Describes how well your character learns and reasons."
    description ["Wizard powers are based on Intelligence.",
      "Your Intelligence might contribute to your Reflex defense.",
      "If you wear light armor, your Intelligence might contribute to your Armor Class.",
      "Intelligence is the key ability for Arcana, History, and Religion skill checks."]
  end

  factory :wisdom, parent: :ability_score do
    name "Wisdom"
    short_name "Wis"
    title "Measures your common sense, perception, self-discipline, and empathy.
    You use your Wisdom score to notice details, sense danger, and get a read on other people."
    description ["Many cleric powers are based on Wisdom.",
      "Your Wisdom might contribute to your Will defense.",
      "Wisdom is the key ability for Dungeoneering, Heal, Insight, Nature, and Perception skill checks."]
  end

  factory :charisma, parent: :ability_score do
    name "Charisma"
    short_name "Cha"
    title "Measures your force of personality, persuasiveness, and leadership."
    description ["Many paladin and warlock powers are based on Charisma.",
      "Your Charisma might contribute to your Will defense.",
      "Charisma is the key ability for Bluff, Diplomacy, Intimidate, and Streetwise skill checks."]
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
