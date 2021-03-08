require 'frame'

describe Frame do
  describe '#is_strike?' do
    it 'returns true if the frame input is a strike' do
      frame = Frame.new(10)
      expect(frame.is_strike?).to be true
    end
  end

  describe '#is_spare?' do
    it 'returns true if the frame input contain a spare' do
      frame = Frame.new(5,5)
      expect(frame.is_spare?).to be true
    end
  end
end
