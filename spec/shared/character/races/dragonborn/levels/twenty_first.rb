shared_context "21th level dragonborn" do
	context "21th level dragonborn (cleric)" do
    before :all do
      @char = build_character(type: :dragonborn_cleric, level: 21)
    end

    it "should have 'Draconic Heritage' bonus to healing_surge_value (healing_surge_value + constitution_modifier)" do
      pending "Implement"
      @char.healing_surge_value.should eq 17
    end

    it "should have 7 (with Dragonbreath encounter power) encounter power slots" do
      pending "Implement"
      @char.encounter_powers_known.should eq 7
    end

    it "should have 2 utility power slot" do
      pending "Implement"
      @char.utility_powers_known.should eq 2
    end

    it "should have 2 atwill power slots" do
      pending "Implement"
      @char.atwill_powers_known.should eq 2
    end

    it "should have 2 daily power slot" do
      pending "Implement"
      @char.daily_powers_known.should eq 2
    end

    it "should have 5 feat slots" do
      pending "Implement"
      @char.feats_known.should eq 5
    end

    it "has turn_undead_burst_squares equal to 8" do
      @char.turn_undead_burst_squares.should eq 8 #8 squares for 21st level
    end

    #Turn Undead power
    it "has turn_undead_dice_amount equal to 5" do
      @char.turn_undead_dice_amount.should eq 5
    end

    #Healing Word
    it "has healing_word_burst_squares equal to 15" do
      @char.healing_word_burst_squares.should eq 15
    end

    it "has healing_word_regain_dice equal to 5" do
      @char.healing_word_regain_dice.should eq 5
    end

    #Lance of faith power
    it "has lance_of_faith_hit_dice equal to 2" do
      @char.lance_of_faith_hit_dice.should eq 2
    end

    #Priests shield power
    it "has priests_shield_hit_dice equal to 2" do
      @char.priests_shield_hit_dice.should eq 2
    end
	end
end
