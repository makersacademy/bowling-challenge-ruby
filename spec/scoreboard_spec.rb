require 'scoreboard'

describe Scoreboard do
  before do
    @rolls = [1,4,4,5,6,4,5,5,10,0,1,7,3,6,4,10,2,8,6]
    @scoreboard = Scoreboard.new(@rolls)
  end

  context '#strike' do
    it 'return true when strike' do
      strike_index = 8 
      expect(@scoreboard.strike?(strike_index)).to be true
    end
    it 'return false when not strike' do
      not_strike_index = 0
      expect(@scoreboard.strike?(not_strike_index)).to be_falsey
    end
  end

  context '#spare' do
    it 'return true when spare' do
      spare_index = 4
      expect(@scoreboard.spare?(spare_index)).to be true
    end
    it 'return false when not spare' do
      not_spare_index = 0
      expect(@scoreboard.spare?(not_spare_index)).to be_falsey
    end
  end

  context '#score' do
    it 'return the score of a game' do
      expect(@scoreboard.score).to eq 133
    end
    it 'return a perfect game score' do
      perfect_rolls = [10,10,10,10,10,10,10,10,10,10,10,10]
      scoreboard = Scoreboard.new(perfect_rolls)
      expect(scoreboard.score).to eq 300
    end
    it 'return a gutter game score' do
      gutter_rolls = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
      scoreboard = Scoreboard.new(gutter_rolls)
      expect(scoreboard.score).to eq 0
    end
  end

  context '#strike_bonus_points' do
    it 'return the bonus points when strike' do
      strike_index = 8
      expect(@scoreboard.strike_bonus_points(strike_index)).to eq 1
    end
  end

  context '#spare_bonus_points' do
    it 'return the bonus points when spare' do
      spare_index = 4
      expect(@scoreboard.spare_bonus_points(spare_index)).to eq 5
    end
  end

  context '#regular_points' do
    it 'return the points for a frame when not strike or spare' do
      frame_index = 0
      expect(@scoreboard.regular_points(frame_index)).to eq 5
    end
  end

end
