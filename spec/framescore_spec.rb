require 'framescore'

describe FrameScore do

  let(:frame) { described_class.new }
  let(:roll_1) { 6 }
  let(:roll_2) { 2 }

  describe '#initialize' do
    it 'with a 2 element empty array' do
      expect(frame.frame_rolls).to match_array([])
    end
  end

  describe '#single_frame_roll' do
    it 'stores the amount of pins knocked down in the first roll of the frame' do
      expect(frame).to respond_to(:single_frame_roll).with(1).argument
      expect(frame.single_frame_roll(roll_1)).to include(6)
      expect(frame.single_frame_roll(roll_2)).to include(2)
      expect(frame.frame_rolls.first).to eq(6)
      expect(frame.frame_rolls.last).to eq(2)
      expect(frame.frame_rolls).to eq([6, 2])
    end
  end

  describe '#clear' do
    it 'clears the current frame rolls' do
      frame.clear
      expect(frame.frame_rolls).to eq([])
    end
  end

  context 'raise an error' do
    it 'when anything but an integer is input as a score' do
      expect { frame.single_frame_roll("I'm a string") }.to raise_error("Enter a score between 0-10")
      expect { frame.single_frame_roll(45.23) }.to raise_error("Enter a score between 0-10")
    end
  end

  context 'raise an error' do
    it 'when a number that isnt between 0 to 10 is entered as a roll score' do
      expect { frame.single_frame_roll(-34) }.to raise_error("Enter a score between 0-10")
      expect { frame.single_frame_roll(3546) }.to raise_error("Enter a score between 0-10")
    end
  end

  context 'raise an error' do
    it 'if two rolls score more than 10' do
      frame.single_frame_roll(8)
      expect { frame.single_frame_roll(5) }.to raise_error("Total score more than 10")
    end
  end

  context '@frame_rolls is never more than 2 elements' do
    it 'when entering in roll scores for one frame of bowling' do
      frame.single_frame_roll(roll_1)
      frame.single_frame_roll(roll_2)
      expect(frame.frame_rolls.length).to eq(2)
      expect(frame.frame_rolls).to contain_exactly(6, 2)
    end
  end

  

end
