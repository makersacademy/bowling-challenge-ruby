require 'game'

RSpec.describe 'BowlingGame' do
  let(:game) {BowlingGame.new}

  context '#gutter_game' do
    it 'can roll all zero game' do
      20.times{game.roll(0)}
      expect(game.score).to eq 0
    end
  end

  context '#all_one_game' do
    it 'can roll an all one game' do
      20.times{game.roll(1)}
      expect(game.score).to eq 20
    end
  end

  context '#spare_game' do 
    it 'can roll a spare game' do
      game.roll(6)
      game.roll(4)
      game.roll(7)
      17.times{game.roll(0)}
      expect(game.score).to eq 24
    end
  end

  context '#strike_game' do
    it 'can roll a strike game' do
      game.roll(10)
      game.roll(6)
      game.roll(3)
      16.times{game.roll(0)}
      expect(game.score).to eq 28
    end
  end

  context '#all_spares' do
    it 'can roll all spares' do 
      21.times{game.roll(5)}
      expect(game.score).to eq 150
    end
  end

  context '#perfect_game' do
    it 'can roll all 10 game' do 
      12.times{game.roll(10)}
      expect(game.score).to eq 300
    end
  end
end