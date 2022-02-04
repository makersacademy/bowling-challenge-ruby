require 'frame'

describe Frame do
  before(:each) { Frame.class_variable_set :@@log, [] }

  describe '.accet_roll?' do
    it 'returns true if first roll is <= 10' do
      expect(Frame.accept_roll?(10)).to be(true)
    end

    it 'reutrns true if the last frame is complete' do
      Frame.fallen_pins(10)
      Frame.fallen_pins(10)
      expect(Frame.accept_roll?(10)).to be(true)
    end

    it 'returns false if roll is over 10' do
      expect(Frame.accept_roll?(11)).to be(false)
    end

    it 'calls to check frame 10' do
      10.times { Frame.fallen_pins(10) }
      expect(Frame).to receive(:frame10_valid?).with 10
      Frame.accept_roll?(10)
    end

    it 'returns false if roll one + two > 10' do
      Frame.fallen_pins(7)
      expect(Frame.accept_roll?(4)).to be(false)
    end
  end

  describe '.frame10_valid?' do
    it 'returns false if frame 10 is complete' do
      12.times { Frame.fallen_pins(10) }
      expect(Frame.frame10_valid?(10)).to be(false)
    end

    it 'returns true up to 10 for both rolls following a strike' do
      11.times { Frame.fallen_pins(10) }
      expect(Frame.frame10_valid?(10)).to be(true)
      expect(Frame.frame10_valid?(10)).to be(true)
    end

    it 'returns true up to 10 for the roll following a spare' do
      9.times { Frame.fallen_pins(10) }
      Frame.fallen_pins(7)
      Frame.fallen_pins(3)
      expect(Frame.frame10_valid?(10)).to be(true)
    end
  end

  describe '.fallen_pins' do
    it 'creates a new frame on the first fallen pins' do
      expect(Frame).to receive(:new).with 1
      Frame.fallen_pins(1)
    end

    it 'adds to the first frame with the second fallen pins' do
      Frame.fallen_pins(1)
      expect(Frame).to_not receive(:new).with 1
      Frame.fallen_pins(1)
    end

    it 'creates a new frame on the third fallen pins' do
      Frame.fallen_pins(1)
      Frame.fallen_pins(1)
      expect(Frame).to receive(:new).with 1
      Frame.fallen_pins(1)
    end

    context 'first roll is a strike' do
      it 'creates a new frame on second roll' do
        expect(Frame).to receive(:new).with 10
        Frame.fallen_pins(10)
        expect(Frame).to receive(:new).with 1
        Frame.fallen_pins(1)
      end
    end
  end

  describe '.add_bonuses' do
    it 'adds bonuses to the first frame' do
      Frame.fallen_pins(10)
      Frame.add_bonuses([1], 7)
      Frame.add_bonuses([1], 2)
      expect(Frame.frame_totals.sum).to eq(19)
    end

    it 'adds bonuses to subsequent frames' do
      Frame.fallen_pins(10)
      Frame.fallen_pins(10)
      Frame.add_bonuses([2], 10)
      Frame.add_bonuses([2], 3)
      expect(Frame.frame_totals.sum).to eq(33)
    end
  end

  describe '.frame_totals' do
    it 'reutrns an array of all frame totals' do
      Frame.fallen_pins(10)
      Frame.fallen_pins(10)
      Frame.fallen_pins(5)
      Frame.add_bonuses([1], 15)
      Frame.fallen_pins(5)
      Frame.add_bonuses([2], 10)
      Frame.fallen_pins(4)
      Frame.add_bonuses([3], 4)
      expect(Frame.frame_totals).to eq([25, 20, 14, 4])
    end
  end

  describe '.strike?' do
    it 'returns true if the last frame is a strike' do
      Frame.new(10)
      expect(Frame).to be_strike
    end
  end

  describe '.spare?' do
    it 'returns true if the last frame is a spare' do
      spare_frame = Frame.new(7)
      spare_frame.roll_two = 3
      expect(Frame).to be_spare
    end
  end

  describe '#complete?' do
    context 'last frame is a strike' do
      it 'returns true if the last frame is complete' do
        strike_frame = Frame.new(10)
        expect(strike_frame).to be_complete
      end
    end

    context 'last frame is a spare' do
      it 'returns true if the last frame is complete' do
        spare_frame = Frame.new(7)
        spare_frame.roll_two = 3
        expect(spare_frame).to be_complete
      end
    end

    context 'last frame is 0 / 0' do
      it 'returns true if the last frame is complete' do
        zero_frame = Frame.new(0)
        zero_frame.roll_two = 0
        expect(zero_frame).to be_complete
      end
    end

    context 'last frame is 3 / 3' do
      it 'returns true if the last frame is complete' do
        three_frame = Frame.new(3)
        three_frame.roll_two = 3
        expect(three_frame).to be_complete
      end
    end
  end
end
