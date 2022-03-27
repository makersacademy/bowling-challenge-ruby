require 'frame'

describe Frame do
  describe '.add_roll' do
    it 'has a no score when created' do
      expect(subject.roll_1).to eq nil
      expect(subject.roll_2).to eq nil
    end

    it 'has a score against roll 1' do
      subject.add_roll(4)
      expect(subject.roll_1).to eq 4
      expect(subject.roll_2).to eq nil
    end

    it 'has a score against roll 2' do
      subject.add_roll(4)
      subject.add_roll(3)
      expect(subject.roll_1).to eq 4
      expect(subject.roll_2).to eq 3
    end

    it 'does not allow a score greater than 10' do
      subject.add_roll(6)
      expect{ subject.add_roll(7) }.to raise_error 'Maximum score of 10 allowed'
    end

    it 'does not allow a score greater than 10' do
      expect{ subject.add_roll(11) }.to raise_error 'Maximum score of 10 allowed'
    end
  end

  describe '.complete?' do
    it 'returns true when both roll_1 and roll_2 has a value' do
      subject.add_roll(4)
      subject.add_roll(3)
      expect(subject.complete?).to be true
    end

    it 'returns true when roll_1 is a strike' do
      subject.add_roll(10)
      expect(subject.complete?).to be true
    end

    it 'returns false when only roll_1 is passed and not a strike' do
      subject.add_roll(5)
      expect(subject.complete?).to be false
    end

    it 'returns false when both roll_1 and roll_2 are nil' do
      expect(subject.complete?).to be false
    end
  end

    describe '.spare?' do
      it 'return true if roll_1 and roll_2 equal 10' do
        subject.add_roll(5)
        subject.add_roll(5)
        expect(subject.spare?).to be true
      end
    end

    describe '.strike?' do
      it 'return true if roll_1 equal 10' do
        subject.add_roll(10)
        expect(subject.strike?).to be true
      end
    end
end