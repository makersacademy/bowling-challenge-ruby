require 'bowling' 

describe Bowling do

  context 'following the basic rules' do

    game = Bowling.new

    it 'totals 9 after a frame of 1 and 4' do
      expect(game.total_score).to eq(0)
      game.roll(1)
      game.roll(4)
      expect(game.total_score).to eq(5)
    end

    it 'calculates spares' do
      game.roll(6)
      game.roll(4)
      game.roll(5) # bonus
      game.roll(0)

      expect(game.total_score).to eq(25)
    end

    it 'calculates strikes' do
      game.roll(10)
      game.roll(1)
      game.roll(2)
      expect(game.total_score).to eq(41)
    end

  end

  context 'example game' do
    
    game = Bowling.new

    it 'calculates a total score of 133' do
      game.roll(1)
      game.roll(4)
      game.roll(4)
      game.roll(5)
      game.roll(6)
      game.roll(4)
      game.roll(5)
      game.roll(5)
      game.roll(10)
      game.roll(0)
      game.roll(1)
      game.roll(7)
      game.roll(3)
      game.roll(6)
      game.roll(4)
      game.roll(10)
      game.roll(2)
      game.roll(8)
      game.roll(6)

      expect(game.total_score).to eq(133)
    end
  end

  context 'gutter game' do

    game = Bowling.new

    it 'calculates a score of 0' do
      20.times {game.roll(0) }
      expect(game.total_score).to eq(0)
    end

  end

  context 'perfect game' do

    game = Bowling.new

    it 'calculates a score of 300' do
      12.times do
        game.roll(10)
      end
      
      expect(game.total_score).to eq(300)
    end
    
  end
end
