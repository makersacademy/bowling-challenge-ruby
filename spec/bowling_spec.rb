require 'bowling' 

describe Bowling do

  context 'example game' do

    game = Bowling.new

    it 'totals 9 after a frame of 1 and 4' do
      expect(game.total_score).to eq(0)
      p "rolling 1..."
      game.roll(1)
      p "rolling 4..."
      game.roll(4)
      p game.frames_and_totals
      expect(game.total_score).to eq(5)
    end

    it 'calculates spares' do
      p "rolling 6..."
      game.roll(6)
      p "rolling 4..."
      game.roll(4)
      p game.frames_and_totals

      p "rolling 5..."
      game.roll(5) # bonus
      p game.frames_and_totals
      p "rolling 0..."
      game.roll(0)
      p game.frames_and_totals

      expect(game.total_score).to eq(25)
    end

    it 'calculates strikes' do
      p "rolling 10..."
      game.roll(10)
      p game.frames_and_totals

      p "rolling 1..."
      game.roll(1)
      p game.frames_and_totals
      p "rolling 2..."
      game.roll(2)
      p game.frames_and_totals

      expect(game.total_score).to eq(41)
    end

    # it 'further rolls' do
    #   p "rolling 10..."
    #   game.roll(10)
    #   p game.frames_and_totals
    #   p game.total_score
    #   p "rolling 1.."
    #   game.roll(1)
    #   p game.frames_and_totals
    #   p game.total_score
    #   p "rolling 1.."
    #   game.roll(1)
    #   p game.frames_and_totals
    #   p game.total_score

    #   expect(game.total_score).to eq(53)
    # end

  end

end
