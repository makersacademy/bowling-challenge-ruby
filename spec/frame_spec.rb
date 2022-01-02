require 'frame'

describe Frame do
  let(:frame1) { Frame.new }
  let(:frame2) { Frame.new }
  let(:frame3) { Frame.new }

  describe '#initialize' do
    it 'sets up instance variables to hold scores per roll' do
      expect(frame1.rolls).to be_empty 
      expect(frame1.strike).to eq false
      expect(frame1.spare).to eq false     
    end
  end

  describe '#update_roll(current_roll, pins_knocked_down)' do
    it 'updates the roll score instance variable' do
      expect(frame1.rolls).to be_empty 

      frame1.update_roll(1, 7)
      frame1.update_roll(2, 1)

      expect(frame1.rolls[0]).to eq 7
      expect(frame1.rolls[1]).to eq 1
    end

    it 'records if the roll was a strike' do
      frame1.update_roll(1, 10)

      expect(frame1.strike).to eq true
    end

    it 'voids the second roll if the first roll was a strike' do
      frame1.update_roll(1, 10)

      expect(frame1.rolls.length).to eq 1
    end

    it 'records if the roll was a spare' do
      frame1.update_roll(1, 5)
      frame1.update_roll(2, 5)

      expect(frame1.spare).to eq true
    end
  end

  describe '#add_bonus' do
    it 'calculates bonus points from a strike and saves them in a bonus instance variable' do
      frame1.update_roll(1, 10)
      frame2.update_roll(1, 3)
      frame2.update_roll(2, 4)

      frame1.add_bonus(frame2)

      expect(frame1.bonus).to eq [3, 4]
    end

    it 'calculates bonus points for two strikes in a row' do
      frame1.update_roll(1, 10)
      frame2.update_roll(1, 10)
      frame3.update_roll(1, 3)
      frame3.update_roll(2, 4)

      frame1.add_bonus(frame3, frame2)

      expect(frame1.bonus).to eq [10, 3]
    end

    it 'calculates bonus points for two or more strikes in a row' do
      frame1.update_roll(1, 10)
      frame2.update_roll(1, 10)
      frame3.update_roll(1, 10)

      frame1.add_bonus(frame3, frame2)

      expect(frame1.bonus).to eq [10, 10]
    end

    it 'calculates bonus points from a spare and saves them in a bonus instance variable' do
      frame1.update_roll(1, 5)
      frame1.update_roll(2, 5)
      frame2.update_roll(1, 4)
      frame2.update_roll(2, 3)

      frame1.add_bonus(frame2)

      expect(frame1.bonus).to eq [4]
    end
  end

  describe '#final_round_bonus' do
    it 'adds bonus scores for a strike on frame 10' do
      frame1.update_roll(1, 10)

      frame1.final_round_bonus(6)
      frame1.final_round_bonus(2)

      expect(frame1.bonus).to eq [6, 2]
    end    

    it 'adds bonus scores for a strike on frame 10' do
      frame1.update_roll(1, 10)

      frame1.final_round_bonus(10)
      frame1.final_round_bonus(10)

      expect(frame1.bonus).to eq [10, 10]
    end  
    
    it 'adds bonus scores for a spare on frame 10' do
      frame1.update_roll(1, 8)
      frame1.update_roll(2, 2)

      frame1.final_round_bonus(4)

      expect(frame1.bonus).to eq [4]     
    end
  end
end