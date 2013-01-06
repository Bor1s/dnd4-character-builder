shared_context "1st level dragonborn" do
	context "1st level dragonborn (cleric)" do
		subject do
      FactoryGirl.build(:dragonborn_character)
		end

    its(:vision) { should eq 'normal' }
    its(:speed) { should eq 6 }
    its(:size) { should eq 'medium' }

		it "should have appropriate class" do
			subject.character_race.name.should eq "Dragonborn"
		end

		it "should have +2 Strength and +2 Charisma ability scores modifiers" do
			FactoryGirl.create(:strength_rule)
			FactoryGirl.create(:charisma_rule)
			RuleProcessor.new(subject).process

			subject.strength.should eq 2
			subject.charisma.should eq 2
		end

    it "should have 'Common' and 'Draconic' languages" do
      FactoryGirl.create(:common_language)
      FactoryGirl.create(:draconic_language)

      FactoryGirl.create(:dragonborn_languages_rule)
			RuleProcessor.new(subject).process

      subject.languages.map(&:name).should eq ["Common", "Draconic"]
    end

		it "should have +2 History and +2 Intimidate skills bonuses" do
			FactoryGirl.create(:history_rule)
			FactoryGirl.create(:intimidate_rule)
			RuleProcessor.new(subject).process

			subject.history.should eq 2
			subject.intimidate.should eq 2
		end

    it "should have 'Draconic Heritage' bonus to healing_surge_value" do
      ability_scores = AbilityScoreGenerator.standard_array

      subject.ability_scores.each do |s|
        s.update_attributes(value: ability_scores.shift)
      end

      FactoryGirl.create(:hit_points_rule)
      FactoryGirl.create(:healing_surge_value_rule)
      FactoryGirl.create(:draconic_heritage_rule)

      RuleProcessor.new(subject).process
      subject.healing_surge_value.should eq (subject.hit_points / 4 + subject.constitution_modifier)
    end

    it "should have 5 encounter power slots" do
      FactoryGirl.create(:encounters_known_at_first_level_rule)
      FactoryGirl.create(:dragon_breath_rule)
      FactoryGirl.create(:cleric_encounter_powers_known)

      RuleProcessor.new(subject).process
      subject.encounter_powers_known.should eq 5
    end

    include_context "hit points, healing surges and bloodied value"
	end
end
