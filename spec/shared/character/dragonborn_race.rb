shared_context "dragonborn race" do
	context "Dragonborn race" do
		subject do
		 dr = FactoryGirl.create(:dragonborn_character)
		 dr.tap do |c|
		 	c.ability_scores = [
	  		FactoryGirl.create(:strength, character: dr),
	  		FactoryGirl.create(:dexterity, character: dr),
	  		FactoryGirl.create(:constitution, character: dr),
	  		FactoryGirl.create(:wisdom, character: dr),
	  		FactoryGirl.create(:intelligence, character: dr),
	  		FactoryGirl.create(:charisma, character: dr)
	  	]
	  	c.skills = [
	  		FactoryGirl.create(:history, characters: [dr]),
	  		FactoryGirl.create(:intimidate, characters: [dr])
	  	]
		  end
		end

		it "should have appropriate class" do
			subject.character_race.name.should eq "Dragonborn"
		end

		it "should have +2 Strength and +2 Charisma ability scores modifiers" do
			FactoryGirl.create(:strength_rule)
			FactoryGirl.create(:charisma_rule)
			RuleProcessor.new(subject).process

			subject.strength.should eq 2
			subject.charisma.should eq 2
		end

		it "should have +2 History and +2 Intimidate skills bonuses" do
			FactoryGirl.create(:trained_history_rule)
			FactoryGirl.create(:trained_intimidate_rule)
			FactoryGirl.create(:history_rule)
			FactoryGirl.create(:intimidate_rule)
			RuleProcessor.new(subject).process

			subject.history.should eq 2
			subject.intimidate.should eq 2
		end
	end
end
