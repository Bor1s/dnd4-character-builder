shared_context "6th level dragonborn" do
	context "6th level dragonborn (cleric)" do
    subject do
      build_character(race: :dragonborn_character, level: 6)
    end

    it "should have 'Draconic Heritage' bonus to healing_surge_value (healing_surge_value + constitution_modifier)" do
      subject.healing_surge_value.should eq 14
    end

    it "should have 6 (with Dragonbreath encounter power) encounter power slots" do
      subject.encounter_powers_known.should eq 6
    end

    it "should have 2 utility power slot" do
      subject.utility_powers_known.should eq 2
    end

    it "should have 2 atwill power slots" do
      subject.atwill_powers_known.should eq 2
    end

    it "should have 2 daily power slot" do
      subject.daily_powers_known.should eq 2
    end

    it "should have 4 feat slots" do
      subject.feats_known.should eq 4
    end

    include_context "hit points, healing surges and bloodied value"
	end
end
