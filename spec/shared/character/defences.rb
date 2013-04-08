shared_context "defences" do
  context "defence of" do
    before :all do
      @char = build_character(type: :dragonborn_cleric, level: 1)
    end

    it "#fortitude has proper value" do
      @char.fortitude.should eq 14 #10 + 0 + 4 (current strength_modifier)
    end

    it "#will has proper value" do
      @char.will.should eq 12 #10 + 0 + 2 (current charisma_modifier)
    end

    it "#reflex has proper value" do
      @char.reflex.should eq 12 #10 + 0 + 2 (current dexterity_modifier)
    end

    it "#armor_class has proper (lightweight) value" do
      @char.armor_class.should eq 12 #10 + 0 + 2 (current dexterity_modifier)
    end
  end
end
