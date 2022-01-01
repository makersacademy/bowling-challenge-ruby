require 'frame'

describe Frame do
  let(:frame) { Frame.new }
  let(:next_frame) { Frame.new }

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

    it 'records if the roll was a strike' do
      frame.update_roll(1, 10)

      expect(frame.strike).to eq true
    end

    it 'voids the second roll if the first roll was a strike' do
      frame.update_roll(1, 10)

      expect(frame.rolls[1]).to eq 0
    end
  end

  describe '#add_bonus' do
    it 'calculates bonus points from a strike and saves them in a bonus instance variable' do
      frame.update_roll(1, 10)
      next_frame.update_roll(1, 3)
      next_frame.update_roll(2, 4)

      frame.add_bonus(next_frame)

      expect(frame.bonus).to eq 7
    end
  end
end