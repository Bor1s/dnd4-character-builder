FactoryGirl.define do
  factory :character_class do
  end
  
  factory :cleric, parent: :character_class do
    name "Cleric"
    hit_points_at_first_level 12
    hit_points_per_level 5
    healing_surges_per_day 7
    trained_skills_count 4
    #type "CharacterClass::Cleric"
    #role "Leader. You lead by shielding allies with your prayers, healing, and using powers that improve your allies' attacks."
    #power_source "Divine. You have been invested with the authority to wield divine power on behalf of a deity, faith, or philosophy."
    #key_abilities [:wisdom, :strength, :charisma]
    #armor_proficiencies [:cloth, :leather, :hide, :chainmail]
    #weapon_proficiencies [:simple_melee, :simple_ranged]
    #implement :holy_symbol
    #defence_bonus Hash[will: 2]
    #healing_surges_per_day 7 #+ Consitution modifier
    ##TODO Implement Skills factory, skills table and character_skills skill_id:integer trained:boolean
    #trained_skills [:religion]
    ##TODO Implement tables for cleric build options and class features
    #build_options [:battle_cleric, :devoted_cleric]
    #class_features [:channel_divinity, :healers_lore, :healing_word, :ritual_casting]
  end

  #TODO Implement paragon and Epic paths tables
  #factory :angelic_avenger do
  #end
  
  #factory :divine_oracle do
  #end
  #...
end
