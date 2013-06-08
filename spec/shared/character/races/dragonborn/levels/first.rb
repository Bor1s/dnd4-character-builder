shared_context "1st level dragonborn" do
  context "1st level dragonborn (cleric)" do
    before :all do
      @char = build_character(type: :dragonborn_cleric, level: 1)
    end

    #specify { @char.vision.should eq 'normal' }
    #specify { @char.speed.should eq 6 }
    #specify { @char.size.should eq 'medium' }

    it "should have appropriate race" do
      @char.race.name.should eq "Dragonborn"
    end

    it "should have +2 Strength and +2 Charisma ability scores modifiers" do
      @char.strength.should eq 18
      @char.charisma.should eq 14
    end

    it "should have 'Common' and 'Draconic' languages" do
      pending 'Implement languages support'
      @char.languages.map(&:name).should eq ["Common", "Draconic"]
    end

    it "should have +2 History and +2 Intimidate skills bonuses" do
      @char.history.should eq 2
      @char.intimidate.should eq 2
    end

    it "should have 2 at-will power slots" do
      @char.atwill_powers_known.should eq 2
    end

    it "should have 5 encounter power slots" do
      @char.encounter_powers_known.should eq 5
    end

    it "has turn_undead_burst_squares equal to 2" do
      @char.turn_undead_burst_squares.should eq 2
    end

    it "has healing_word_burst_squares equal to 5" do
      @char.healing_word_burst_squares.should eq 5
    end

    it "has healing_word_regain_dice equal to 1" do
      @char.healing_word_regain_dice.should eq 1
    end

    #Lance of faith power
    it "has lance_of_faith_hit_dice equal to 1" do
      @char.lance_of_faith_hit_dice.should eq 1
    end

    #Priests shield power
    it "has priests_shield_hit_dice equal to 1" do
      @char.priests_shield_hit_dice.should eq 1
    end

  end
end
