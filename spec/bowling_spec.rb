# frozen_string_literal: true

require 'bowling'

describe BowlingGame do
  context 'no strikes or spares' do 
    it 'returns a total of all the pins knocked down simply added together' do 
      game = BowlingGame.new(Kernel, [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1])
      expect(game.score).to eq(20)
    end

    it 'returns a total of all the pins knocked down simply added together' do 
      game = BowlingGame.new(Kernel, [3, 1, 4, 5, 8, 0, 2, 2, 1, 7, 4, 2, 5, 4, 3, 0, 0, 0, 7, 1])
      expect(game.score).to eq(59)
    end
  end

  context 'normal game plus some strikes' do
    it 'returns the score + when theres a strike it applies a bonus to that frame (10 + following 2 rolls)' do
      game = BowlingGame.new(Kernel, [1, 4, 4, 5, 6, 3, 5, 3, 10, 0, 1, 7, 2, 6, 2, 10, 2, 7])
      expect(game.score).to eq(88)
    end

    it 'returns the score + when theres a strike it applies a bonus to that frame (10 + following 2 rolls)' do 
      game = BowlingGame.new(Kernel, [4, 3, 6, 0, 7, 2, 10, 3, 1, 6, 3, 10, 10, 10, 3, 1])
      expect(game.score).to eq(120)
    end
  end

  context 'normal game plus some spares' do 
    it 'returns the score + when theres a spare it applies a bonus to that frame (10 + first roll of the next frame)' do 
      game = BowlingGame.new(Kernel, [8, 0, 5, 3, 9, 1, 5, 5, 1, 3, 0, 4, 5, 5, 1, 3, 9, 0, 3, 4])
      expect(game.score).to eq(81)
    end
  end

  context 'more examples' do 
    it 'returns 300 for a perfect game' do
      game = BowlingGame.new(Kernel, [10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10])
      expect(game.score).to eq(300)
    end

    it 'returns 0 for a game of zeros' do
      game = BowlingGame.new(Kernel, Array.new(20, 0))
      expect(game.score).to eq(0)
    end

    it 'returns the correct score for a game involving normal frames + strikes + spares' do 
      game = BowlingGame.new(Kernel, [1, 4, 4, 5, 6, 4, 5, 5, 10, 0, 1, 7, 3, 6, 4, 10, 2, 8, 6])
      expect(game.score).to eq(133)
    end
  end
end
