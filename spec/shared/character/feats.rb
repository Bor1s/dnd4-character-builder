shared_context "feats" do

  describe "feats" do

    it "are all present in new character and must be unused and unavailable" do
      char = build_character(type: :dragonborn_cleric, level: 1)
      char.feats.should_not be_empty
      char.feats.count.should eq Templates::Feat.count
      char.feats.map(&:available).all?.should be_false
      char.feats.map(&:used).all?.should be_false
    end

    it "are available for character (feature needed only to select wich feats are will be used (processed by RuleProcessor))" do
      available_feat_names = ["chainmail_armor_proficiency", "alterness"]
      char = build_character(type: :dragonborn_cleric, level: 1)
      char.feats.in(name: available_feat_names).map(&:available).all?.should be_true
    end
  end

end
