require 'bowling_game'

describe Bowling_game do
  subject (:game) {Bowling_game.new}

  context 'Whilst playing a game of 10-pin bowling' do

    it 'creates a game' do
      game
    end

    it 'can roll a gutter game' do
      20.times{game.roll 0}
      expect(game.score).to eq(0)
    end

    it 'can roll all ones' do
      20.times{game.roll 1}
      expect(game.score).to eq(20)
    end

    it 'can roll a spare' do
      game.roll(5)
      game.roll(5)
      game.roll(3)
      17.times{game.roll 0}
      expect(game.score).to eq (16)
    end

    it 'can roll a game full of spares' do
      21.times{game.roll 5}
      expect(game.score). to eq (150)
    end

    it 'can roll a strike' do
      game.roll(10)
      game.roll(6)
      game.roll(1)
      16.times{game.roll 0}
      expect(game.score).to eq(24)
    end

    it 'can roll a perfect game' do
      12.times{game.roll 10}
      expect(game.score).to eq (300)
    end
  end
end
