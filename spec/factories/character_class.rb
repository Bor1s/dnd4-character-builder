FactoryGirl.define do
  factory :character_class do
  end
  
  factory :cleric, parent: :character_class do
    name "Cleric"
    hit_points_at_first_level 12
    hit_points_per_level 5
    healing_surges_per_day 7
    trained_skills_count 4
    mandatory_trained_skills [:religion]

    features [:channel_divinity, :healers_lore, :healing_word, :ritual_casting]
    armor_proficiencies [:cloth, :leather, :hide, :chainmail]
    weapon_proficiencies [:simple_melee, :simple_ranged]
    implement :holy_symbol
    #power_source "Divine. You have been invested with the authority to wield divine power on behalf of a deity, faith, or philosophy."
    #defence_bonus Hash[will: 2]
  end

  #TODO Implement paragon and Epic paths tables
  #factory :angelic_avenger do
  #end
  
  #factory :divine_oracle do
  #end
  #...
end
