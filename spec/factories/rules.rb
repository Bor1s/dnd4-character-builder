#FactoryGirl.define do
  #factory :rule do
  #end

  #factory :hit_points, parent: :rule do
    #name :hit_points
    #formula "->() do
      #character_class.basic_hit_points +
        #(level == 1 ? 0 : character_class.per_level_hit_points) +
          #ability_scores.constitution
    #end"
  #end

  #factory :healing_surges, parent: :rule do
    #name :healing_surges
    #formula "->() do
      #character_class.healing_surges_per_day + ability_scores.constitution_modifier
    #end"
  #end

  #factory :healing_surge_value, parent: :rule do
    #name :healing_surge_value
    #formula "->(){ hit_points / 4 }"
  #end

  #factory :bloodied_value, parent: :rule do
    #name :bloodied_value
    #formula "->(){ hit_points / 2 }"
  #end
#end



#FactoryGirl.define do
  #factory :rule, class: "Rules::Base" do
  #end
  
  #factory :hit_points_by_level, parent: :rule do
    #name :hit_points_by_level
    #result :per_level_hit_points #take from character class 
    #conditions Hash[
      #left: :level, #take from character
      #right: 0,
      #operator: :>
    #]
  #end

  #factory :start_hit_points, parent: :rule do
    #name :start_hit_points
    #result Hash[ 
      #left: :basic_hit_points, #take from character class
      #right: :constitution, #take from character ability scores
      #operator: :+
    #]
  #end

  ## Hit points: hit_points_by_level + start_hit_points
  #factory :hit_points, parent: :rule do
    #name :hit_points
    #result [FactoryGirl.build(:hit_points_by_level), FactoryGirl.build(:start_hit_points)]
  #end
#end
