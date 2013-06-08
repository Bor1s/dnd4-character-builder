shared_context "level advancement" do
  context '1st level rules' do

    describe 'Applies' do
      before :all do
        @char = build_character(stage: 1)
      end

      it '2 atwills' do
        @char.atwill_powers_known.should eq 2
      end

      it '1 encounter' do
        @char.encounter_powers_known.should eq 1
      end

      it '1 daily' do
        @char.daily_powers_known.should eq 1
      end

      it 'nil utilities' do
        @char.utility_powers_known.should eq nil
      end

      it '1 feats known' do
        @char.feats_known.should eq 1
      end
    end
    
    describe 'Reverts' do
      before :all do
        stage = 1
        @char = build_character(stage: stage)
        RuleProcessor.new(@char).revert(stage)
      end

      it '2 atwills' do
        @char.atwill_powers_known.should eq 0
      end

      it '1 encounter' do
        @char.encounter_powers_known.should eq 0
      end

      it '1 daily' do
        @char.daily_powers_known.should eq 0
      end

      it 'nil utilities' do
        @char.utility_powers_known.should eq nil
      end

      it '1 feats known' do
        @char.feats_known.should eq 0
      end
    end
  end
end
