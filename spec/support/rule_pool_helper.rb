module RulePoolHelper
  def prepare_rules_set
    #Dragonborn benefits
    FactoryGirl.create(:common_language)
    FactoryGirl.create(:draconic_language)

    #Prepares all 'rules'
    FactoryGirl.factories.map do |fc|
      FactoryGirl.create(fc.name) if fc.name.match(/_rule\z/)
    end
  end

  def prepare_character_races
    FactoryGirl.create(:dragonborn_template)
  end

  def prepare_character_classes
    FactoryGirl.create(:cleric_template)
  end

  def prepare_skills
    FactoryGirl.create(:acrobatics_template)
    FactoryGirl.create(:arcana_template)
    FactoryGirl.create(:athletics_template)
    FactoryGirl.create(:bluff_template)
    FactoryGirl.create(:diplomacy_template)
    FactoryGirl.create(:dungeoneering_template)
    FactoryGirl.create(:endurance_template)
    FactoryGirl.create(:heal_template)
    FactoryGirl.create(:history_template)
    FactoryGirl.create(:insight_template)
    FactoryGirl.create(:intimidate_template)
    FactoryGirl.create(:nature_template)
    FactoryGirl.create(:perception_template)
    FactoryGirl.create(:religion_template)
    FactoryGirl.create(:stealth_template)
    FactoryGirl.create(:streetwise_template)
    FactoryGirl.create(:thievery_template)
  end

  def prepare_languages
    FactoryGirl.create(:common_language_template)
    FactoryGirl.create(:draconic_language_template)
  end

  def prepare_feats
    FactoryGirl.create(:action_surge_template)
    FactoryGirl.create(:agile_hunter_template)
    FactoryGirl.create(:alterness_template)
    FactoryGirl.create(:armor_of_bahamut_template)
    FactoryGirl.create(:chainmail_armor_proficiency_template)
  end

  def prepare_powers
    #Prepares all 'powers'
    FactoryGirl.factories.map do |fc|
      FactoryGirl.create(fc.name) if fc.name.match(/_power\z/)
    end
  end

  def build_character(options = {})
    character = FactoryGirl.create(options[:type], level: options[:level])
    ability_scores = AbilityScoreGenerator.standard_array
    character.strength = ability_scores.shift
    character.dexterity = ability_scores.shift
    character.constitution = ability_scores.shift
    character.charisma = ability_scores.shift
    character.intelligence = ability_scores.shift
    character.wisdom = ability_scores.shift
    character.stub(:constitution_increased? => false)
    character.stub(:constitution_increased_to_even? => false)

    RuleProcessor.new(character).process
    character
  end
end
