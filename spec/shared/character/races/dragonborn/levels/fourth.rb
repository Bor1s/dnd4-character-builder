shared_context "4th level dragonborn" do
	context "4th level dragonborn (cleric)" do
    before :all do
      ability_scores = AbilityScoreGenerator.standard_array
      @char = FactoryGirl.create(:dragonborn_character, level: 4,
                                     strength: ability_scores.shift,
                                     dexterity: ability_scores.shift,
                                     constitution: ability_scores.shift,
                                     charisma: ability_scores.shift,
                                     intelligence: ability_scores.shift,
                                     wisdom: ability_scores.shift)

      @char.constitution += 1
      @char.stub(:constitution_increased_to_even? => true)

      RuleProcessor.new(@char).process
      @char
    end

    it "should have 1 points for upgrading 2 different ability scores" do
      @char.ability_scores_upgrade_points.should eq 2
    end

    it "should have 'Draconic Heritage' bonus to healing_surge_value (healing_surge_value + constitution_modifier)" do
      @char.healing_surge_value.should eq 13 #Should be 12, but hit points increased by 1 (constitution increased)
    end

    it "should have 6 (with Dragonbreath encounter power) encounter power slots" do
      @char.encounter_powers_known.should eq 6
    end

    it "should have 1 utility power slot" do
      @char.utility_powers_known.should eq 1
    end

    it "should have 2 atwill power slots" do
      @char.atwill_powers_known.should eq 2
    end

    it "should have 1 daily power slot" do
      @char.daily_powers_known.should eq 1
    end

    it "should have 3 feat slots" do
      @char.feats_known.should eq 3
    end

    it 'hit points should have increased value when constitution increased' do
      @char.hit_points.should eq 47
    end
    
    it 'heling surges should have increased value when constitution increased to even' do
      @char.healing_surges.should eq 10 # +1 for even number of constitution (stubbed :constitution_increased_to_even? => true)
    end

	end
end
