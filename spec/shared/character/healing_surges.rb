shared_context 'healing surges' do
  context "#healing_surges" do
    specify { subject.should respond_to :healing_surges }
    it "should be calculated properly" do
    end
  end

  context "#healing_surge_value" do
    specify { subject.should respond_to :healing_surge_value }
    it "should be calculated properly without any bonuses" do
    end

    it "should be calculated properly with racial trait bonus (Dragonborn heritage (+ Con mod to healing surges))" do
    end
  end
end
