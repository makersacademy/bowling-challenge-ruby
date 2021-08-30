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

  describe '#store_first_roll' do
    it 'stores the amount of pins knocked down in the first roll of the frame' do
      expect(frame).to respond_to(:store_first_roll).with(1).argument
      expect(frame.store_first_roll(roll_1)).to include(6)
      expect(frame.rolls.first).to eq(6)
    end 
  end

  describe '#store_second_roll' do
    it 'stores the amount of pins knocked down in the second roll of the frame' do
      expect(frame).to respond_to(:store_second_roll).with(1).argument
      expect(frame.store_second_roll(roll_2)).to include(2)
      expect(frame.rolls.last).to eq(2)
    end 
  end

# raise error if input isn't an int
# check @rolls is only a 2 element array

end