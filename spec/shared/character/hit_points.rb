shared_context "hit points" do

  context "#hit_points" do
    specify { subject.should respond_to :hit_points }
    it "should be calculated properly" do
    end
  end
  
end
