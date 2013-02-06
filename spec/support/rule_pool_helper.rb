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

  def build_character(options = {})
    character = FactoryGirl.build(options[:race], level: options[:level])
    ability_scores = AbilityScoreGenerator.standard_array

    character.ability_scores.each do |s|
      s.update_attributes(value: ability_scores.shift)
    end
    RuleProcessor.new(character).process
    character
  end
end
