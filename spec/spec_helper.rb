# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'
require 'capybara/rspec'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

RSpec.configure do |config|
  # ## Mock Framework
  #
  # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
  #
  # config.mock_with :mocha
  # config.mock_with :flexmock
  # config.mock_with :rr

  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  # config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  # config.use_transactional_fixtures = true

  # If true, the base class of anonymous controllers will be inferred
  # automatically. This will be the default behavior in future versions of
  # rspec-rails.
  config.infer_base_class_for_anonymous_controllers = false

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = "random"

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
 
end

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
