require 'frame'

describe Frame do
  let(:frame) { described_class.new }

  describe '#record_roll' do
    it 'stores the roll in an array' do
      frame.record_roll(5)
      expect(frame.contents).to eq([5])
    end
  end

  describe '#raw_score' do
    it 'returns the score without bonuses' do
      frame.record_roll(5)
      frame.record_roll(5)
      expect(frame.raw_score).to eq(10)
    end
  end

  describe '#spare?' do
    it 'returns true if the player rolled a spare' do
      frame.record_roll(5)
      frame.record_roll(5)
      expect(frame.spare?).to eq(true)
    end
  end

  describe '#strike?' do
    it 'returns true if the player rolled a strike' do
      frame.record_roll(10)
      expect(frame.strike?).to eq(true)
    end
  end

  describe '#rolls' do
    it 'returns the number of rolls the player took this framew' do
      frame.record_roll(10)
      expect(frame.rolls).to eq(1)
    end
  end
end