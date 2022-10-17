require_relative '../lib/frame'

RSpec.describe Frame do
  context 'with a roll' do
    it 'calculates the score for the roll' do
      frame = Frame.new(3, 5)

      expect(frame.score).to eq(8)
    end
  end

  describe '#strike?' do
    it 'returns true if the first roll is strike' do
      frame = Frame.new(10,0)

      expect(frame.strike?).to eq(true)
    end

    it 'returns false if the last roll is 10' do
      frame = Frame.new(0, 10)

      expect(frame.strike?).to eq(false)
    end
  end

  describe '#spare?' do
    it 'returns true if it is spare' do
      frame = Frame.new(3, 7)

      expect(frame.spare?).to eq(true)
    end

    it 'returns false if it is not spare' do
      frame = Frame.new(3, 6)

      expect(frame.spare?).to eq(false)
    end
  end
end