require 'game'

describe Game do
 
  let(:game) { Game.new }
  let(:open_frame) { 
    double( :open_frame,
    roll_1: 1,
    roll_2: 2, 
    strike?: false, 
    spare?: false, 
    bonus_rolls: nil,
    score: 3)
  }

  let(:strike_frame) { 
    double( :strike_frame,
    roll_1: 10,
    roll_2: nil, 
    strike?: true, 
    spare?: false, 
    bonus_rolls: 2,
    score: 10)
  }
  
  let(:spare_frame) {
    double( :spare_frame,
    roll_1: 5,
    roll_2: 5, 
    strike?: false, 
    spare?: true, 
    bonus_rolls: 1,
    score: 10)
  }

  describe '#add_frame' do
    it 'adds the frame' do
      game.add_frame(strike_frame)
      expect(game.frames).to eq [strike_frame]
    end
  end

  describe '#total_score' do
    it 'returns the sum of scores' do
      game = Game.new([
        double(score: 25), 
        double(score: 20), 
        double(score: 11), 
        double(score: 3),
        double(score: 10)
        ])
      expect(game.total_score).to eq 69
    end
  end
end
