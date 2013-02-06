shared_context "3rd level dragonborn" do
	context "3rd level dragonborn (cleric)" do
    subject do
      build_character(race: :dragonborn_character, level: 3)
    end

		it "should have strength and charisma with ability scores modifiers" do
			subject.strength.should eq 18
			subject.charisma.should eq 14
		end

		it "should have history and intimidate skills bonuses" do
			subject.history.should eq 2
			subject.intimidate.should eq 2
		end

    it "should have 'Draconic Heritage' bonus to healing_surge_value" do
      subject.healing_surge_value.should eq 11
    end

    it "should have 6 (with Dragonbreath encounter power) encounter power slots" do
      subject.encounter_powers_known.should eq 6
    end

    it "should have 1 utility power slot" do
      subject.utility_powers_known.should eq 1
    end

    it "should have 2 feat slots" do
      subject.feats_known.should eq 2
    end

    include_context "hit points, healing surges and bloodied value"
	end
end
