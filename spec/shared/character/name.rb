shared_context "name" do
  context "#name" do
    it 'should be' do
      subject.should respond_to :name
    end

    it 'from 3 to 50 characters long is valid' do
      subject.name = "fu"
      subject.should_not be_valid
      subject.name = 'A'*51
      subject.should_not be_valid
      subject.name = "Frodo"
      subject.should be_valid
    end
  end
end
