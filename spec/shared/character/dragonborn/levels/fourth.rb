shared_context "4th level dragonborn" do
	context "4th level dragonborn (cleric)" do
    subject do
      character = FactoryGirl.create(:dragonborn_character, level: 4)
      ability_scores = AbilityScoreGenerator.standard_array
      character.strength = ability_scores.shift
      character.dexterity = ability_scores.shift
      character.constitution = ability_scores.shift
      character.charisma = ability_scores.shift
      character.intelligence = ability_scores.shift
      character.wisdom = ability_scores.shift
      character.stub(:constitution_increased? => true)
      character.stub(:constitution_increased_to_even? => true)

      RuleProcessor.new(character).process
      character
    end

    it "should have 1 points for upgrading 2 different ability scores" do
      subject.ability_scores_upgrade_points.should eq 2
    end

    it "should have 'Draconic Heritage' bonus to healing_surge_value (healing_surge_value + constitution_modifier)" do
      subject.healing_surge_value.should eq 12 #Should be 11, but hit points increased by 1 (constitution increased)
    end

    it "should have 6 (with Dragonbreath encounter power) encounter power slots" do
      subject.encounter_powers_known.should eq 6
    end

    it "should have 1 utility power slot" do
      subject.utility_powers_known.should eq 1
    end

    it "should have 2 atwill power slots" do
      subject.atwill_powers_known.should eq 2
    end

    it "should have 1 daily power slot" do
      subject.daily_powers_known.should eq 1
    end

    it "should have 3 feat slots" do
      subject.feats_known.should eq 3
    end

    it 'hit points should have increased value when constitution increased' do
      subject.hit_points.should eq 46
    end
    
    it 'heling surges should have increased value when constitution increased' do
      subject.healing_surges.should eq 9 # +1 for even number of constitution (stubbed :constitution_increased_to_even? => true)
    end

	end
end
