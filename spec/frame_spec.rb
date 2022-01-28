require 'frame'

describe Frame do
  let(:frame) { Frame.new }

  describe '.start_roll' do
    it 'raises and error when too many pins are added on first roll' do
      expect { frame.start_roll(12) }.to raise_error("Too many pins!")

    end

    it 'raises and error when too many pins (including previous) are added on second roll' do
      frame.roll(8)
      expect { frame.start_roll(8) }.to raise_error("Too many pins!")
    end

    it 'calls roll pins method if <=10  pins on the first roll are added' do
      expect(frame).to receive(:roll).with(4)
      frame.start_roll(4)
    end

    it 'calls roll pins method if <=10  pins (plus previous roll) on the second roll are added' do
      frame.start_roll(4)
      expect(frame).to receive(:roll).with(4)
      frame.start_roll(4)
    end
  end

  describe '.roll' do
    it 'frame scores array includes the number of pins added' do
      frame.roll(8)
      expect(frame.frame_scores).to include 8
    end
  end

end