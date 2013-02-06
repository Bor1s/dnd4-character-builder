shared_context "1st level dragonborn" do
  context "1st level dragonborn (cleric)" do
    subject do
      build_character(race: :dragonborn_character, level: 1)
    end

    its(:vision) { should eq 'normal' }
    its(:speed) { should eq 6 }
    its(:size) { should eq 'medium' }

    it "should have appropriate class" do
      subject.character_race.name.should eq "Dragonborn"
    end

    it "should have +2 Strength and +2 Charisma ability scores modifiers" do
      subject.strength.should eq 18
      subject.charisma.should eq 12
    end

    it "should have 'Common' and 'Draconic' languages" do
      subject.languages.map(&:name).should eq ["Common", "Draconic"]
    end

    it "should have +2 History and +2 Intimidate skills bonuses" do
      subject.history.should eq 2
      subject.intimidate.should eq 2
    end

    it "should have 'Draconic Heritage' bonus to healing_surge_value" do
      subject.healing_surge_value.should eq (subject.hit_points / 4 + subject.constitution_modifier)
    end

    it "should have 5 encounter power slots" do
      subject.encounter_powers_known.should eq 5
    end

    include_context "hit points, healing surges and bloodied value"
  end
end
