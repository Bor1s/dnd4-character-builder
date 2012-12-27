shared_context "dragonborn race" do
	context "Dragonborn race" do
		subject do
		 dr = FactoryGirl.create(:dragonborn_character)
		 dr.tap do |c|
		 	c.ability_scores = [
	  		FactoryGirl.create(:strength, character: dr),
	  		FactoryGirl.create(:dexterity, character: dr),
	  		FactoryGirl.create(:constitution, character: dr),
	  		FactoryGirl.create(:wisdom, character: dr),
	  		FactoryGirl.create(:intelligence, character: dr),
	  		FactoryGirl.create(:charisma, character: dr)
	  	]
	  	c.skills = [
	  		FactoryGirl.create(:history, characters: [dr]),
	  		FactoryGirl.create(:intimidate, characters: [dr])
	  	]
		  end
		end

		it "should have appropriate class" do
      pending
			subject.character_race.name.should eq "Dragonborn"
		end

		it "should have +2 Strength and +2 Charisma ability scores modifiers" do
      pending
			FactoryGirl.create(:strength_rule)
			FactoryGirl.create(:charisma_rule)
			RuleProcessor.new(subject).process

			subject.strength.should eq 2
			subject.charisma.should eq 2
		end

		it "should have +2 History and +2 Intimidate skills bonuses" do
      pending
			FactoryGirl.create(:trained_history_rule)
			FactoryGirl.create(:trained_intimidate_rule)
			FactoryGirl.create(:history_rule)
			FactoryGirl.create(:intimidate_rule)
			RuleProcessor.new(subject).process

			subject.history.should eq 2
			subject.intimidate.should eq 2
		end

    it "should have 'draconic_heritage' bonus to healing_surge_value" do
      pending
      ability_scores = AbilityScoreGenerator.standard_array

      subject.ability_scores.each do |s|
        s.update_attributes(value: ability_scores.shift)
      end

      FactoryGirl.create(:hit_points_by_level_rule)
      FactoryGirl.create(:start_hit_points_rule)
      FactoryGirl.create(:hit_points_rule)
      FactoryGirl.create(:healing_surge_value_rule)
      FactoryGirl.create(:draconic_heritage_rule)

      RuleProcessor.new(subject).process
      subject.healing_surge_value.should eq subject.hit_points / 4 + subject.constitution_modifier
    end

    it "should have 'Dragon Breath' power as additional encounter at first level" do
      FactoryGirl.create(:first_level_advancement_rule)
      FactoryGirl.create(:dragon_breath_rule)
      RuleProcessor.new(subject).process

      subject.encounter_powers_known.should eq 2
    end
	end
end
