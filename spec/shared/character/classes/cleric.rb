shared_context "cleric" do
  context 'Cleric' do

    describe 'Applies' do
      before :all do
        @char = build_character(type: :dragonborn_cleric, stage: 3)
      end

      it '+3 to encounter_powers_known' do
        @char.encounter_powers_known.should eq 3
      end
    end

    describe 'Reverts' do
      before :all do
        stage = 3
        @char = build_character(type: :dragonborn_cleric, stage: stage)
        RuleProcessor.new(@char).revert(stage)
      end

      it '+3 to encounter_powers_known' do
        @char.encounter_powers_known.should eq 0
      end
    end
  end
end
