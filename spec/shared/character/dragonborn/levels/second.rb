shared_context "2nd level dragonborn" do
	context "2nd level dragonborn (cleric)" do
    subject do
      character = init_character_in_first_level
      character.level = 2
      character
    end

    before do
      FactoryGirl.create(:utilities_known_at_second_level_rule)
      FactoryGirl.create(:feats_known_at_second_level_rule)
      RuleProcessor.new(subject).process
    end

		it "should have strength and charisma with ability scores modifiers" do
			subject.strength.should eq 18
			subject.charisma.should eq 12
		end

		it "should have history and intimidate skills bonuses" do
			subject.history.should eq 2
			subject.intimidate.should eq 2
		end

    it "should have 'Draconic Heritage' bonus to healing_surge_value" do
      subject.healing_surge_value.should eq 9
    end

    it "should have 5 encounter power slots" do
      subject.encounter_powers_known.should eq 5
    end

    it "should have 1 utility power slot" do
      subject.utility_powers_known.should eq 1
    end

    it "should have 2 feat slots" do
      subject.feats_known.should eq 2
    end

	end
end
