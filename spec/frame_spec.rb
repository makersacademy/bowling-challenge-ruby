require 'frame'

describe Frame do
  before(:each) { Frame.class_variable_set :@@log, [] }

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

  describe '.current_is_a_strike?' do
    it 'returns true if the last roll was a strike' do
      Frame.fallen_pins(10)
      expect(Frame).to be_current_is_a_strike
    end
  end

  describe '.current_is_a_spare?' do
    it 'returns true if the last roll was a spare' do
      Frame.fallen_pins(7)
      Frame.fallen_pins(3)
      expect(Frame).to be_current_is_a_spare
    end
  end

  describe '.calculate_score' do
    it 'reutrns the total of all frames' do
      Frame.fallen_pins(10)
      Frame.fallen_pins(10)
      Frame.fallen_pins(5)
      Frame.add_bonuses([1], 15)
      Frame.fallen_pins(5)
      Frame.add_bonuses([2], 10)
      Frame.fallen_pins(4)
      Frame.add_bonuses([3], 4)
      expect(Frame.calculate_score).to eq 63
    end
  end
end
