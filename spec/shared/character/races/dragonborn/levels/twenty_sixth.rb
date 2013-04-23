shared_context "26th level dragonborn" do
	context "26th level dragonborn (cleric)" do
    before :all do
      @char = build_character(type: :dragonborn_cleric, level: 26)
    end

    it "should have 'Draconic Heritage' bonus to healing_surge_value (healing_surge_value + constitution_modifier)" do
      @char.healing_surge_value.should eq 39
    end

    it "should have 8 (with Dragonbreath encounter power) encounter power slots" do
      @char.encounter_powers_known.should eq 8
    end

    it "should have 7 utility power slot" do
      @char.utility_powers_known.should eq 7
    end

    it "should have 2 atwill power slots" do
      @char.atwill_powers_known.should eq 2
    end

    it "should have 4 daily power slot" do
      @char.daily_powers_known.should eq 4
    end

    it "should have 16 feat slots" do
      @char.feats_known.should eq 16
    end

    #Turn Undead power
    it "has turn_undead_dice_amount equal to 6" do
      @char.turn_undead_dice_amount.should eq 6
    end

	end
end
