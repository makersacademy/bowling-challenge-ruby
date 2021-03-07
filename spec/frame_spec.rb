require 'frame'

describe Frame do

  let(:frame) { Frame.new(1)}

  describe '#initialize' do
    it 'has a clear score' do
      expect(frame.score).to be_empty
    end

    it 'begins on round 1' do
      expect(frame.round).to eq(1)
    end
  end

  describe '#add_roll' do
    it 'adds the users roll to the current frame' do
      frame.add_roll(5)
      expect(frame.score[0]).to eq(5)
    end
  end

  describe '#strike?' do
    it 'returns true if the user throws a strike' do
      frame.add_roll(10)
      expect(frame.strike?).to eq(true)
    end
  end

  describe '#spare?' do
    it 'returns true if the user throws a spare' do
      frame.add_roll(7)
      frame.add_roll(3)
      expect(frame.spare?).to eq(true)
    end

  end

end