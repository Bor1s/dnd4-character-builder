shared_context "21th level dragonborn" do
	context "21th level dragonborn (cleric)" do
    before :all do
      @char = build_character(type: :dragonborn_cleric, level: 21)
    end

    it "should have 'Draconic Heritage' bonus to healing_surge_value (healing_surge_value + constitution_modifier)" do
      @char.healing_surge_value.should eq 34
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

    it "should have 4 daily power slot" do
      @char.daily_powers_known.should eq 4
    end

    it "should have 13 feat slots" do
      @char.feats_known.should eq 13
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

    #TODO MUST include lower level advancements if character creates higher level from scratch
    it "has +1 to strength" do
      @char.strength.should eq 19
    end

    it "has +1 to constitution" do
      @char.constitution.should eq 14
    end

    it "has +1 to wisdom" do
      @char.wisdom.should eq 11
    end

    it "has +1 to charisma" do
      @char.charisma.should eq 15
    end

    it "has +1 to dexterity" do
      @char.dexterity.should eq 15
    end

    it "has +1 to intelligence" do
      @char.intelligence.should eq 12
    end
	end
end
