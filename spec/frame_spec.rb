require 'frame'

describe Frame do
  describe '#score' do
    it 'returns the total score of the frame' do
      expect(subject.score).to eq(0)
    end
  end

  describe '#set_roll_1' do
    it 'records the score for roll one' do
      subject.set_roll_1(2)
      expect(subject.roll_1).to eq(2)
    end
  end

  describe '#set_roll_2' do
    it 'records the score for roll two' do
      subject.set_roll_2(2)
      expect(subject.roll_2).to eq(2)
    end
  end

end