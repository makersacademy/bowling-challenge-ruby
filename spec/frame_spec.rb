require 'frame'

describe Frame do
  let(:frame) { Frame.new }

  describe '#add_to_frame' do
    it 'adds to the current frame' do
      frame.add_to_frame(10)
      expect(frame.current_frame).to include(10)
    end
  end

  describe '#total' do
    it 'returns the frame total' do
      frame.add_to_frame(10)
      expect(frame.total).to eq(10)
    end
  end

  describe '#first_roll' do
    it 'returns the first roll from current_frame' do
      frame.add_to_frame(5)
      frame.add_to_frame(3)
      expect(frame.first_roll).to eq(5)
    end
  end

  describe '#spare?' do
    it 'return true if the frame is a spare' do
      frame.add_to_frame(5)
      frame.add_to_frame(5)
      expect(frame).to be_spare
    end

    it 'return false if the frame is not a spare' do
      frame.add_to_frame(5)
      frame.add_to_frame(2)
      expect(frame).not_to be_spare
    end
  end

  describe '#strike?' do
    it 'return true if the frame is a strike' do
      frame.add_to_frame(10)
      expect(frame).to be_strike
    end

    it 'return false if the frame is not a strike' do
      frame.add_to_frame(5)
      expect(frame).not_to be_strike
    end
  end

  describe '#add_bonus(pins)' do
    it 'adds bonus pins to frame' do
      frame.add_bonus(5)
      expect(frame.current_frame.pop).to eq(5)
    end
  end
end
