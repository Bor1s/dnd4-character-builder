shared_context "cleric" do
  describe "Cleric" do
    before :all do
      @char = build_character(type: :dragonborn_cleric, level: 1)
    end

    it "has healer's lore bonus for powers with keyword 'healing'" do
      @char.healing_keyword_bonus.should eq 0 #Bonus for 10 Wisdom
    end

    it "has Channel Divinity: Divine Fortune power" do
      divine_fortune = @char.powers.where(name: "divine_fortune").first
      divine_fortune.used.should be_true
    end

    it "has Channel Divinity: Turn Undead power" do
      turn_undead = @char.powers.where(name: "turn_undead").first
      turn_undead.used.should be_true
    end

    it "has Healing Word power" do
      healing_word = @char.powers.where(name: "healing_word").first
      healing_word.used.should be_true
    end

  end
end
