require 'spec_helper'

describe Character do
  it 'basicaly initialized' do
    subject.should be
  end

  context "#name" do
    let(:character) { subject.name = "Fu" } 

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

  it 'has age' do
    subject.should respond_to :age
  end

  it 'has gender' do
    subject.should respond_to :gender
  end

  it 'has height' do
    subject.should respond_to :height
  end

  it 'has weigth' do
    subject.should respond_to :weight
  end

  it 'has background' do
    subject.should respond_to :background
  end

  context '#alignment' do
    let(:good_alignment) { FactoryGirl.build(:good_alignment) }
    let(:lawful_good_alignment) { FactoryGirl.build(:lawful_good_alignment) }
    let(:evil_alignment) { FactoryGirl.build(:evil_alignment) }
    let(:chaotic_evil_alignment) { FactoryGirl.build(:chaotic_evil_alignment) }
    let(:unaligned) { FactoryGirl.build(:unaligned) }

    it 'should be' do
      subject.should respond_to :alignment
    end

    it 'should be some kind' do
      alignment = [good_alignment, lawful_good_alignment, evil_alignment, chaotic_evil_alignment, unaligned].sample
      subject.stub(alignment: alignment)
      subject.alignment.name.should eq alignment.name
    end
  end

  it 'has deity(ies)' do
    subject.should respond_to :deities
  end

  it 'has language(s)' do
    #TODO add factories etc.
    subject.should respond_to :languages
  end

  it 'has level' do
    subject.should respond_to :level
  end

  it 'has expirience' do
    subject.should respond_to :expirience
  end

  it 'has ability scores' do
    subject.should respond_to :ability_scores
  end

  it 'has defences' do
    subject.should respond_to :defences
  end
end
