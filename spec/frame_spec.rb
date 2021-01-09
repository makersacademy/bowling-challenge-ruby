require 'frame'

describe Frame do
  it 'can be initialized' do
    expect(Frame).to respond_to(:new)
  end

  describe '#add_roll_score' do
    it 'adds the score of a roll into @throws' do
      expect { subject.add_roll_score(5) }.to change { subject.throws.sum }.by(5)
    end
  end

  describe '#strike?' do
    it 'returns true if the user knocks down 10 pins on first throw' do
      subject.add_roll_score(10)
      expect(subject.strike?).to eq true
    end

    it 'returns false if the user knocks down less than 10 pins on first throw' do
      subject.add_roll_score(9)
      expect(subject.strike?).to eq false
    end
  end

  describe '#spare?' do
    it 'returns true if the sum of the two throws equal 10' do
      subject.add_roll_score(9)
      subject.add_roll_score(1)
      expect(subject.spare?).to eq true
    end

    it 'returns false if the sum of the two throws are less than 10' do
      subject.add_roll_score(8)
      subject.add_roll_score(1)
      expect(subject.spare?).to eq false
    end

    it 'returns false if the user gets a strike' do
      subject.add_roll_score(10)
      expect(subject.spare?).to eq false
    end
  end

  describe '#add_total_score' do
    it 'adds the amount to the total score of the frame' do
      expect { subject.add_total_score(7) }.to change { subject.total_score }.by(7)
    end
  end
end
