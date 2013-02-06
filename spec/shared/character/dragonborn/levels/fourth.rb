shared_context "4nd level dragonborn" do
	context "4nd level dragonborn (cleric)" do
    subject do
      build_character(race: :dragonborn_character, level: 4)
    end

    it "should have 1 points for upgrading 2 different ability scores" do
      subject.ability_scores_upgrade_points.should eq 2
    end

    it "should have 'Draconic Heritage' bonus to healing_surge_value (healing_surge_value + constitution_modifier)" do
      subject.healing_surge_value.should eq 12
    end

    it "should have 6 (with Dragonbreath encounter power) encounter power slots" do
      subject.encounter_powers_known.should eq 6
    end

    it "should have 1 utility power slot" do
      subject.utility_powers_known.should eq 1
    end

    it "should have 2 atwill power slots" do
      subject.atwill_powers_known.should eq 2
    end

    it "should have 1 daily power slot" do
      subject.daily_powers_known.should eq 1
    end

    it "should have 3 feat slots" do
      subject.feats_known.should eq 3
    end

	end
end
