require 'frame'

RSpec.describe Frame do
  context 'player plays one frame with the first roll = 1 and the second roll = 4' do
    it 'returns 5 points and false for both spare and strike' do
      frame = Frame.new(1, 4)
      expect(frame.sum).to eq 5
      expect(frame.spare?).to eq false
      expect(frame.strike?).to eq false
    end
  end

  context 'player plays one frame with the first roll = 6 and the second roll = 4' do
    it 'returns 10 points, true for spare and false for strike' do
      frame = Frame.new(6, 4)
      expect(frame.sum).to eq 10
      expect(frame.spare?).to eq true
      expect(frame.strike?).to eq false
    end
  end

  context 'player plays one frame with the first roll = 10' do
    it 'returns 10 points, false for spare and true for strike' do
      frame = Frame.new(10, 0)
      expect(frame.sum).to eq 10
      expect(frame.spare?).to eq false
      expect(frame.strike?).to eq true
    end
  end
end