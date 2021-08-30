require 'frame'

describe Frame do

  let(:frame) { described_class.new }
  let(:roll_1) { 6 }
  let(:roll_2) { 2 }

  describe '#initialize' do
    it 'with a 2 element empty array' do
      expect(frame.rolls).to match_array([])
    end
  end

  describe '#store_roll_score' do
    it 'stores the amount of pins knocked down in the first roll of the frame' do
      expect(frame).to respond_to(:store_roll_score).with(1).argument
      expect(frame.store_roll_score(roll_1)).to include(6)
      expect(frame.rolls.first).to eq(6)
    end 
  end

  describe '#store_roll_score' do
    it 'stores the amount of pins knocked down in the second roll of the frame' do
      expect(frame).to respond_to(:store_roll_score).with(1).argument
      expect(frame.store_roll_score(roll_2)).to include(2)
      expect(frame.rolls.last).to eq(2)
    end 
  end

  context 'raise an error' do
    it 'when a anything but an integer is input as a score' do
      expect { frame.store_roll_score("I'm a string") }.to raise_error("Please enter a number between 0 - 10")
      expect { frame.store_roll_score(45.23) }.to raise_error("Please enter a number between 0 - 10")
    end 
  end

  context 'raise an error' do
    it 'when a number that isnt between 0 to 10 is entered as a roll score' do
      expect { frame.store_roll_score(-34) }.to raise_error("Please enter a number between 0 - 10")
      expect { frame.store_roll_score(3546) }.to raise_error("Please enter a number between 0 - 10")
    end 
  end

  context '@rolls is never more than 2 elements' do
    it 'when entering in roll scores for one frame of bowling' do
      frame.store_roll_score(roll_1)
      frame.store_roll_score(roll_2)
      expect(frame.rolls.length).to eq(2)
      expect(frame.rolls).to contain_exactly(6, 2)
    end 
  end

end
