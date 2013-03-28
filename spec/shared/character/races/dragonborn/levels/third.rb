shared_context "3rd level dragonborn" do
	context "3rd level dragonborn (cleric)" do
    before :all do
      @char = build_character(race: :dragonborn_character, level: 3)
    end

		it "should have strength and charisma with ability scores modifiers" do
			@char.strength.should eq 18
			@char.charisma.should eq 14
		end

		it "should have history and intimidate skills bonuses" do
			@char.history.should eq 2
			@char.intimidate.should eq 2
		end

    it "should have 'Draconic Heritage' bonus to healing_surge_value" do
      @char.healing_surge_value.should eq 11
    end

    it "should have 6 (with Dragonbreath encounter power) encounter power slots" do
      @char.encounter_powers_known.should eq 6
    end

    it "should have 1 utility power slot" do
      @char.utility_powers_known.should eq 1
    end

    it "should have 2 feat slots" do
      @char.feats_known.should eq 2
    end

	end
end
