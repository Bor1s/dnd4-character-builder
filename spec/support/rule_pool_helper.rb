module RulePoolHelper
  def prepare_rules_set
    #Hit points, healing surges, bloodied
    FactoryGirl.create(:hit_points_rule)
    FactoryGirl.create(:healing_surges_rule)
    FactoryGirl.create(:healing_surge_value_rule)
    FactoryGirl.create(:bloodied_rule)

    #Dragonborn rules
    FactoryGirl.create(:strength_rule)
    FactoryGirl.create(:charisma_rule)
    FactoryGirl.create(:common_language)
    FactoryGirl.create(:draconic_language)
    FactoryGirl.create(:dragonborn_languages_rule)
    FactoryGirl.create(:history_rule)
    FactoryGirl.create(:intimidate_rule)
    FactoryGirl.create(:draconic_heritage_rule)
    FactoryGirl.create(:dragon_breath_rule)

    #Cleric rules
    FactoryGirl.create(:cleric_encounter_powers_known)

    #First level advancements rule
    FactoryGirl.create(:encounters_known_at_first_level_rule)
    FactoryGirl.create(:atwills_known_at_first_level_rule)
    FactoryGirl.create(:dailies_known_at_first_level_rule)
    FactoryGirl.create(:feats_known_at_first_level_rule)
    FactoryGirl.create(:hit_points_increasing_rule)

    #Second level advancements rule
    FactoryGirl.create(:encounters_known_at_second_level_rule)
    FactoryGirl.create(:atwills_known_at_second_level_rule)
    FactoryGirl.create(:dailies_known_at_second_level_rule)
    FactoryGirl.create(:feats_known_at_second_level_rule)
    FactoryGirl.create(:utilities_known_at_second_level_rule)

    #Third level advancements rule
    FactoryGirl.create(:encounters_known_at_third_level_rule)
    FactoryGirl.create(:atwills_known_at_third_level_rule)
    FactoryGirl.create(:dailies_known_at_third_level_rule)
    FactoryGirl.create(:feats_known_at_third_level_rule)
    FactoryGirl.create(:utilities_known_at_third_level_rule)

    #Fourth level advancements rule
    FactoryGirl.create(:encounters_known_at_fourth_level_rule)
    FactoryGirl.create(:atwills_known_at_fourth_level_rule)
    FactoryGirl.create(:dailies_known_at_fourth_level_rule)
    FactoryGirl.create(:feats_known_at_fourth_level_rule)
    FactoryGirl.create(:utilities_known_at_fourth_level_rule)
    FactoryGirl.create(:ability_scores_upgrade_points_at_fourth_level_rule)
    
    #Fifth level advancements rule
    FactoryGirl.create(:encounters_known_at_fifth_level_rule)
    FactoryGirl.create(:atwills_known_at_fifth_level_rule)
    FactoryGirl.create(:dailies_known_at_fifth_level_rule)
    FactoryGirl.create(:feats_known_at_fifth_level_rule)
    FactoryGirl.create(:utilities_known_at_fifth_level_rule)
  end

  def build_character(options = {})
    prepare_rules_set

    character = FactoryGirl.build(options[:race], level: options[:level])
    ability_scores = AbilityScoreGenerator.standard_array

    character.ability_scores.each do |s|
      s.update_attributes(value: ability_scores.shift)
    end
    RuleProcessor.new(character).process
    character
  end
end
