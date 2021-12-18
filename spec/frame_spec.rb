require 'frame'

describe Frame do
  let(:frame) { Frame.new }

  describe '#initialize' do
    it 'sets up instance variables to hold scores per roll' do
      expect(frame.rolls).to be_empty 
      expect(frame.strike).to eq false
      expect(frame.spare).to eq false     
    end
  end

  describe '#update_roll(current_roll, pins_knocked_down)' do
    it 'updates the roll score instance variable' do
      expect(frame.rolls).to be_empty 

      frame.update_roll(1, 7)
      frame.update_roll(2, 1)

      expect(frame.rolls[0]).to eq 7
      expect(frame.rolls[1]).to eq 1
    end
  end
end