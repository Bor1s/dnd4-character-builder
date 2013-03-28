shared_context "1st level dragonborn" do
  context "1st level dragonborn (cleric)" do
    before :all do
      @char = build_character(race: :dragonborn_character, level: 1)
    end

    specify { @char.vision.should eq 'normal' }
    specify { @char.speed.should eq 6 }
    specify { @char.size.should eq 'medium' }

    it "should have appropriate class" do
      @char.character_race.name.should eq "Dragonborn"
    end

    it "should have +2 Strength and +2 Charisma ability scores modifiers" do
      @char.strength.should eq 18
      @char.charisma.should eq 14
    end

    it "should have 'Common' and 'Draconic' languages" do
      @char.languages.map(&:name).should eq ["Common", "Draconic"]
    end

    it "should have +2 History and +2 Intimidate skills bonuses" do
      @char.history.should eq 2
      @char.intimidate.should eq 2
    end

    it "should have 5 encounter power slots" do
      @char.encounter_powers_known.should eq 5
    end
  end
end
