#Dir.glob(File.expand_path(File.join(File.dirname(__FILE__), "levels", "*.rb"))).each do |name|
  #require name
#end

shared_context "dragonborn race" do
  context 'Dragonborn' do
    #include_context "1st level dragonborn"
    #include_context "2nd level dragonborn"
    #include_context "3rd level dragonborn"
    #include_context "4th level dragonborn"
    #include_context "5th level dragonborn"
    #include_context "6th level dragonborn"
    #include_context "7th level dragonborn"
    #include_context "8th level dragonborn"
  #
    #include_context "11th level dragonborn"
  #
    #include_context "15th level dragonborn"
    #include_context "16th level dragonborn"
  #
    #include_context "21th level dragonborn"
  #
    #include_context "25th level dragonborn"
    #include_context "26th level dragonborn"
    describe 'Applies' do
      before :all do
        @char = build_character(type: :dragonborn, stage: 2)
      end

      it '+2 to charisma' do
        @char.charisma.should eq 2
      end

      it '+2 to strength' do
        @char.strength.should eq 2
      end

      it '+2 to history' do
        @char.history.should eq 2
      end

      it '+2 to intimidate' do
        @char.intimidate.should eq 2
      end

      it 'Draconic Heritage (+ constitution modifier to healing_surge_value)' do
        @char.healing_surge_value.should eq @char.constitution_modifier
      end

      it '+1 to encounter_powers_known (Dragon Breath)' do
        @char.encounter_powers_known.should eq 1
      end
    end

    describe 'Reverts' do
      before :all do
        stage = 2
        @char = build_character(type: :dragonborn, stage: stage)
        RuleProcessor.new(@char).revert(stage)
      end

      it '+2 to charisma' do
        @char.charisma.should eq 0
      end

      it '+2 to strength' do
        @char.strength.should eq 0
      end

      it '+2 to history' do
        @char.history.should eq 0
      end

      it '+2 to intimidate' do
        @char.intimidate.should eq 0
      end

      it 'Draconic Heritage (+ constitution modifier to healing_surge_value)' do
        @char.healing_surge_value.should eq 0
      end

      it '+1 to encounter_powers_known (Dragon Breath)' do
        @char.encounter_powers_known.should eq 0
      end
    end

  end
end
