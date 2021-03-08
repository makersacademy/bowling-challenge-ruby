require 'frame'

describe Frame do
let(:frame) {described_class.new}

  describe '#add_to_frame' do
    it 'a score is added to the current frame' do
      frame.add_to_frame(2)
      expect(frame.current_frame).to include 2
    end
  end

  describe '#total' do
    it 'returns the total of the current frame' do
      2.times{frame.add_to_frame(2)}
      expect(frame.total).to eq 4
    end
  end

  describe '#first_roll' do
    it 'returns the first element of the current frame' do
      frame.add_to_frame(3)
      frame.add_to_frame(5)
      expect(frame.first_roll).to eq 3
    end
  end

  describe '#strike' do
    it 'returns true if frame is a strike' do
      frame.add_to_frame(10)
      frame.add_to_frame(0)
      expect(frame).to be_strike
    end
    it 'returns false if frame is not a strike' do
      frame.add_to_frame(8)
      frame.add_to_frame(0)
      expect(frame).not_to be_strike
    end
  end

  describe '#spare' do
    it 'returns true if frame is a spare' do
      2.times{frame.add_to_frame(5)}
      expect(frame).to be_spare
    end
    it 'returns false if frame is not a spare' do
      frame.add_to_frame(8)
      frame.add_to_frame(0)
      expect(frame).not_to be_spare
    end
  end
end
