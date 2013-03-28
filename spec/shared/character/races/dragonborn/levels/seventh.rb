shared_context "7th level dragonborn" do
	context "7th level dragonborn (cleric)" do
    before :all do
      @char = build_character(race: :dragonborn_character, level: 7)
    end

    it "should have 'Draconic Heritage' bonus to healing_surge_value (healing_surge_value + constitution_modifier)" do
      @char.healing_surge_value.should eq 16
    end

    it "should have 7 (with Dragonbreath encounter power) encounter power slots" do
      @char.encounter_powers_known.should eq 7
    end

    it "should have 2 utility power slot" do
      @char.utility_powers_known.should eq 2
    end

    it "should have 2 atwill power slots" do
      @char.atwill_powers_known.should eq 2
    end

    it "should have 2 daily power slot" do
      @char.daily_powers_known.should eq 2
    end

    it "should have 4 feat slots" do
      @char.feats_known.should eq 4
    end
	end
end
