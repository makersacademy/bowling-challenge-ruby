require 'bowling' 

describe Bowling do

  context 'example game' do

    game = Bowling.new

    it 'totals 9 after a frame of 1 and 4' do
      expect(game.total_score).to eq(0)
      p "rolling 1..."
      game.roll(1)
      p game.total_score
      p "rolling 4..."
      game.roll(4)
      p game.total_score
      expect(game.total_score).to eq(5)
    end

    it 'calculates spares' do
      p "rolling 6..."
      game.roll(6)
      p game.total_score
      p "rolling 4..."
      game.roll(4)
      p game.total_score

      p "rolling 5..."
      game.roll(5) # bonus
      p game.total_score
      p "rolling 0..."
      game.roll(0)
      p game.total_score

      expect(game.total_score).to eq(25)
    end

    it 'calculates strikes' do
      p "rolling 10..."
      game.roll(10)
      p game.total_score

      p "rolling 1..."
      game.roll(1)
      p game.total_score
      p "rolling 2..."
      game.roll(2)
      p game.total_score

      expect(game.total_score).to eq(41)
    end

    it 'further rolls' do
      p "rolling 10..."
      game.roll(10)
      p game.total_score
      p "rolling 1.."
      game.roll(1)
      p game.total_score
      p "rolling 1.."
      game.roll(1)
      p game.total_score

      expect(game.total_score).to eq(55)
    end

  end

  context 'another example game' do
    
    game = Bowling.new

    it 'calculates a total score of 133' do
      game.roll(1)
      p game.frames_and_totals
      game.roll(4)
      p game.frames_and_totals
      game.roll(4)
      p game.frames_and_totals
      game.roll(5)
      p game.frames_and_totals
      game.roll(6)
      p game.frames_and_totals
      game.roll(4)
      p game.frames_and_totals
      game.roll(5)
      p game.frames_and_totals
      game.roll(5)
      p game.frames_and_totals
      game.roll(10)
      p game.frames_and_totals
      game.roll(0)
      p game.frames_and_totals
      game.roll(1)
      p game.frames_and_totals
      game.roll(7)
      p game.frames_and_totals
      game.roll(3)
      p game.frames_and_totals
      game.roll(6)
      p game.frames_and_totals
      game.roll(4)
      p game.frames_and_totals
      game.roll(10)
      p game.frames_and_totals
      game.roll(2)
      p game.frames_and_totals
      game.roll(8)
      p game.frames_and_totals
      game.roll(6)
      p game.frames_and_totals

      expect(game.total_score).to eq(133)
    end
  end

end
