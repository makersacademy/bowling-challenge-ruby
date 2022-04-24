require 'frame'

describe Frame do
  describe '.add_roll' do
    it 'has no score when created' do
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

  describe '.regular_frame_complete?' do
    it 'knows it is not the tenth frame' do
      subject.tenth_frame = true
      expect(subject.regular_frame_complete?).to be false
    end

    it 'knows it is complete if roll_1 is a strike' do
      subject.add_roll(10)
      expect(subject.regular_frame_complete?).to be true
    end

    it 'knows it is complete if roll_1 and roll_2 are played' do
      subject.add_roll(3)
      subject.add_roll(5)
      expect(subject.regular_frame_complete?).to be true
    end

    it 'knows it is not complete if only roll_1 is played and not a strike' do
      subject.add_roll(3)
      expect(subject.regular_frame_complete?).to be false
    end
  end

  describe '.tenth_frame_complete?' do
    it 'knows that it is not complete if it is not the tenth frame' do
      expect(subject.tenth_frame_complete?).to be false
    end

    it 'knows it is complete if 3 rolls have been played' do
      subject.tenth_frame = true
      subject.add_roll(5)
      subject.add_roll(5)
      subject.add_roll(5)
      expect(subject.tenth_frame_complete?).to be true
    end

    it 'knows it is not complete if roll_3 has not been played and roll_1 is a strike' do
      subject.tenth_frame = true
      subject.add_roll(10)
      subject.add_roll(5)
      expect(subject.tenth_frame_complete?).to be false
    end

    it 'knows it is not complete if roll_3 has not been played and roll_2 is a spare' do
      subject.tenth_frame = true
      subject.add_roll(6)
      subject.add_roll(4)
      expect(subject.tenth_frame_complete?).to be false
    end

    it 'knows it is not complete if roll_2 has not been played and is not a strike' do
      subject.tenth_frame = true
      subject.add_roll(6)
      expect(subject.tenth_frame_complete?).to be false
    end

    it 'knows it is complete if roll_1 and roll_2 did not make a spare' do
      subject.tenth_frame = true
      subject.add_roll(3)
      subject.add_roll(3)
      expect(subject.tenth_frame_complete?).to be true
    end
  end

  describe '.frame_score' do
    it 'returns score of a frame if roll_1 is a strike' do
      subject.add_roll(10)
      expect(subject.frame_score).to eq 10
    end

    it 'returns score of a frame if roll_1 is not a strike' do
      subject.add_roll(6)
      subject.add_roll(3)
      expect(subject.frame_score).to eq 9
    end

    it 'returns score of a frame if roll_3 is played' do
      subject.tenth_frame = true
      subject.add_roll(5)
      subject.add_roll(5)
      subject.add_roll(8)
      expect(subject.frame_score).to eq 18
    end

    it'returns score including bonus points' do
      subject.tenth_frame = true
      subject.add_roll(5)
      subject.add_roll(5)
      subject.add_bonus_points(3)
      expect(subject.frame_score).to eq 13
    end
  end
end