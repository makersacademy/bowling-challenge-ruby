require 'frame'

describe Frame do
  context 'the default frame' do
    it { is_expected.to have_attributes(pins: 10) }

    it { is_expected.to respond_to(:rolls) }
  end

  context '#ended?' do
    it 'defaults to false' do
      expect(subject.ended?).to be false
    end
  end

  context '#add' do
    let(:roll) { double(:roll) }

    it 'can store rolls' do
      allow(roll).to receive(:pins).and_return(5)
      subject.add(roll)
      expect(subject.rolls).to eq [roll]
    end

    it 'can deduct pins by the amount rolled over' do
      allow(roll).to receive(:pins).and_return(5)
      subject.add(roll)
      expect(subject.pins).to eq 5
    end

    it 'can store a second roll' do
      allow(roll).to receive(:pins).and_return(1)
      subject.add(roll)
      subject.add(roll)

      expect(subject.rolls).to eq [roll, roll]
    end
  end

  context '#score' do
    let(:roll) { double(:roll) }
    
    it 'can score a frame' do
      allow(roll).to receive(:pins).and_return(1)
      subject.add(roll)
      subject.add(roll)

      expect(subject.score).to eq 2
    end
  end

end
