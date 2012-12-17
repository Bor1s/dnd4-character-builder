shared_context "alignment" do
  context '#alignment' do
    let(:good_alignment) { FactoryGirl.build(:good_alignment) }
    let(:lawful_good_alignment) { FactoryGirl.build(:lawful_good_alignment) }
    let(:evil_alignment) { FactoryGirl.build(:evil_alignment) }
    let(:chaotic_evil_alignment) { FactoryGirl.build(:chaotic_evil_alignment) }
    let(:unaligned) { FactoryGirl.build(:unaligned) }

    it 'should be' do
      subject.should respond_to :alignment
    end

    it 'should be some kind of' do
      alignment = [good_alignment, lawful_good_alignment, evil_alignment, chaotic_evil_alignment, unaligned].sample
      subject.stub(alignment: alignment)
      subject.alignment.name.should eq alignment.name
    end
  end
end
