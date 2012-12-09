shared_context "race" do
  context "#character_race" do
    it 'should be' do
      subject.should respond_to :character_race
    end
  end
end
