shared_context "16th level dragonborn" do
	context "16th level dragonborn (cleric)" do
    before :all do
      @char = build_character(type: :dragonborn_cleric, level: 16)
    end

    it "should have 'Draconic Heritage' bonus to healing_surge_value (healing_surge_value + constitution_modifier)" do
      @char.healing_surge_value.should eq 27
    end

    it "should have 8 (with Dragonbreath encounter power) encounter power slots" do
      @char.encounter_powers_known.should eq 8
    end

    it "should have 5 utility power slot" do
      @char.utility_powers_known.should eq 5
    end

    it "should have 2 atwill power slots" do
      @char.atwill_powers_known.should eq 2
    end

    it "should have 3 daily power slot" do
      @char.daily_powers_known.should eq 3
    end

    it "should have 10 feat slots" do
      @char.feats_known.should eq 10
    end

    #Turn Undead power
    it "has turn_undead_dice_amount equal to 4" do
      @char.turn_undead_dice_amount.should eq 4
    end
	end
end
