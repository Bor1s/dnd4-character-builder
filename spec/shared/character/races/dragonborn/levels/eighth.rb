shared_context "8th level dragonborn" do
	context "8th level dragonborn (cleric)" do
    before :all do
      @char = build_character(type: :dragonborn_cleric, level: 8)
    end

    it "should have 'Draconic Heritage' bonus to healing_surge_value (healing_surge_value + constitution_modifier)" do
      @char.healing_surge_value.should eq 20
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

    it "should have 5 feat slots" do
      @char.feats_known.should eq 5
    end

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
