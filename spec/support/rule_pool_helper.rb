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
    FactoryGirl.create(:dragonborn)
  end

  def prepare_character_classes
    FactoryGirl.create(:cleric)
  end

  def prepare_skills
    FactoryGirl.create(:acrobatics)
    FactoryGirl.create(:arcana)
    FactoryGirl.create(:athletics)
    FactoryGirl.create(:bluff)
    FactoryGirl.create(:diplomacy)
    FactoryGirl.create(:dungeoneering)
    FactoryGirl.create(:endurance)
    FactoryGirl.create(:heal)
    FactoryGirl.create(:history)
    FactoryGirl.create(:insight)
    FactoryGirl.create(:intimidate)
    FactoryGirl.create(:nature)
    FactoryGirl.create(:perception)
    FactoryGirl.create(:religion)
    FactoryGirl.create(:stealth)
    FactoryGirl.create(:streetwise)
    FactoryGirl.create(:thievery)
  end

  def prepare_languages
    FactoryGirl.create(:common_language)
    FactoryGirl.create(:draconic_language)
  end

  def prepare_feats
    FactoryGirl.create(:action_surge)
    FactoryGirl.create(:agile_hunter)
    FactoryGirl.create(:alterness)
    FactoryGirl.create(:armor_of_bahamut)
    FactoryGirl.create(:chainmail_armor_proficiency)
  end

  def prepare_powers
    #Prepares all 'powers'
    FactoryGirl.factories.map do |fc|
      FactoryGirl.create(fc.name) if fc.name.match(/_power\z/)
    end
  end

  def build_character(type: nil, level: 1, stage: :all)
    if type
      character = FactoryGirl.create(type, level: level)
    else
      character = Character.new(level: level)
    end

    ability_scores = AbilityScoreGenerator.standard_array
    character.strength = ability_scores.shift
    character.dexterity = ability_scores.shift
    character.constitution = ability_scores.shift
    character.charisma = ability_scores.shift
    character.intelligence = ability_scores.shift
    character.wisdom = ability_scores.shift

    RuleProcessor.new(character).process(stage)
    character
  end
end
