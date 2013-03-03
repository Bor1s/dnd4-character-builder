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

  def prepare_languages
    FactoryGirl.create(:common_language_template)
    FactoryGirl.create(:draconic_language_template)
  end

  def build_character(options = {})
    character = FactoryGirl.create(options[:race], level: options[:level])
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
