require 'frame'

describe Frame do
  let(:frame) { described_class.new }
  describe '#add_to_frame' do
    it 'adds to the current frame' do
      frame.add_to_frame(10)
      expect(frame.current_frame).to include(10)
    end
  end

  describe '#total' do
    it 'returns the total of current_frame' do
      frame.add_to_frame(5)
      frame.add_to_frame(9)
      expect(frame.total).to eq(14)
    end
  end

  describe '#first_roll' do
    it 'returns the first element in current_frame' do
      frame.add_to_frame(1)
      frame.add_to_frame(2)
      expect(frame.first_roll).to eq(1)
    end
  end

  describe '#spare' do
    it 'returns true if a frame is a spare' do
      frame.add_to_frame(5)
      frame.add_to_frame(5)
      expect(frame).to be_spare
    end

    it 'returns false if frame is not a spare' do
      frame.add_to_frame(3)
      frame.add_to_frame(2)
      expect(frame).not_to be_spare
    end
  end

  describe '#strike' do
    it 'returns true if a frame is a strike' do
      frame.add_to_frame(10)
      frame.add_to_frame(0)
      expect(frame).to be_strike
    end

    it 'returns false if frame is not a strike' do
      frame.add_to_frame(3)
      frame.add_to_frame(2)
      expect(frame).not_to be_strike
    end
  end

  describe 'add_bonus(pins)' do
    it 'adds bonus pins to frame' do
      frame.add_bonus(5)
      expect(frame.current_frame.pop).to eq(5) 
    end
  end

  describe 'length' do 
    it 'returns the length of the current frame' do
      current_frame = frame.current_frame
      expect(frame.length).to eq current_frame.length
    end
  end

  describe 'bonus_frame?' do
      it 'knows whether a frame contains bonus score' do
      frame.add_to_frame(3)
      frame.add_to_frame(7)
      frame.add_to_frame(2)
      expect(frame).to be_bonus_frame
    end
  end

  describe '#first_two' do
    it 'sums only the first two rolls of a frame' do
    frame.add_to_frame(3)
    frame.add_to_frame(7)
    frame.add_to_frame(2)
    end
  end

end  