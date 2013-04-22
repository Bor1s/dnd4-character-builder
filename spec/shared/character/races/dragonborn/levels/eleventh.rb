shared_context "11th level dragonborn" do
	context "11th level dragonborn (cleric)" do
    before :all do
      @char = build_character(type: :dragonborn_cleric, level: 11)
    end

    it "should have 'Draconic Heritage' bonus to healing_surge_value (healing_surge_value + constitution_modifier)" do
      @char.healing_surge_value.should eq 21
    end

    it "should have 8 (included 1 Dragonbreath encounter power and 3 cleric powers) encounter power slots" do
      @char.encounter_powers_known.should eq 8
    end

    it "should have 3 utility power slot" do
      @char.utility_powers_known.should eq 3
    end

    it "should have 2 atwill power slots" do
      @char.atwill_powers_known.should eq 2
    end

    it "should have 3 daily power slot" do
      @char.daily_powers_known.should eq 3
    end

    it "should have 7 known feats" do
      @char.feats_known.should eq 7
    end

    it "has turn_undead_burst_squares equal to 5" do
      @char.turn_undead_burst_squares.should eq 5 #5 squares for 11st level
    end

    #Turn Undead power
    it "has turn_undead_dice_amount equal to 3" do
      @char.turn_undead_dice_amount.should eq 3
    end

    #Healing Word power
    it "has healing_word_burst_squares equal to 10" do
      @char.healing_word_burst_squares.should eq 10
    end

    it "has healing_word_regain_dice equal to 3" do
      @char.healing_word_regain_dice.should eq 3
    end
	end
end
