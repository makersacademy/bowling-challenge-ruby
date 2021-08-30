require 'frame'

describe Frame do

  let(:frame) { described_class.new }
  let(:roll_1) { 6 }

  describe '#initialize' do
    it 'with a 2 element empty array' do
      expect(frame.rolls).to match_array([])
    end
  end

  describe '#store_first_roll' do
    it 'stores the first roll the user inputs' do
      expect(frame).to respond_to(:store_first_roll).with(1).argument
      expect(frame.store_first_roll(roll_1)).to include(6)
      expect(frame.rolls.first).to eq(6)
    end 
  end

# raise error if input isn't an int
# check @rolls is only a 2 element array

end