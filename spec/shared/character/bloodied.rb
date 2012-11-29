shared_context 'bloodied' do
  context "#bloodied_value" do
    specify { subject.should respond_to :bloodied_value }
    it "should be calculated properly" do
    end
  end
end
