FactoryGirl.define do
  factory :feat_template, class: Templates::Feat do
    factory :action_surge_template do
      name :action_surge
      prerequisite "Human"
      benefit "You gain a +3 bonus to attack rolls you make during any action you gained by spending an action point"
    end

    factory :agile_hunter_template do
      name :agile_hunter
      prerequisite "Ranger, Dex 15, Hunter's Quarry class feature"
      benefit "When you score a critical hit with a melee attack against the target of your Hunter's Quarry, you can shift as a free action, and the enemy takes a -2 penalty on attack rolls against you until the end of your next turn"
    end

    factory :alterness_template do
      name :alterness
      benefit "You don't grant enemies combat advantage during surprise rounds. You also gain a +2 feat bonus to Perception checks"
    end

    factory :armor_of_bahamut_template do
      name :armor_of_bahamut
      prerequisite "Channel Divinity class feature, must worship Bahamut"
      benefit "You can invoke the power of your deity to use armor of Bahamut" #+1 encounter_powers_known
    end

    factory :chainmail_armor_proficiency_template do
      name :chainmail_armor_proficiency
      prerequisite "Str 13, Con 13, training with leather or hide armor"
      benefit "You gain training with chainmail"
    end
    
    #TODO continue create templates
  end
end
