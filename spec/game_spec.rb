require 'game'
RSpec.describe 'BowlingGame' do

  context '#gutter game' do
    it 'can roll all zero game' do
      game = BowlingGame.new
      20.times{game.roll(0)}
      expect(game.score).to eq 0
    end
  end

  context 'all one game' do
    it 'can roll an all one game' do
      game = BowlingGame.new
      20.times{game.roll(1)}
      expect(game.score).to eq 20
    end
  end

  context 'spare game' do 
    it 'can roll a spare game' do
      game = BowlingGame.new
      game.roll(6)
      game.roll(4)
      game.roll(7)
      17.times{game.roll(0)}
      expect(game.score).to eq 24
    end
  end

  context 'strike game' do
    it 'can roll a strike game' do
      game = BowlingGame.new
      game.roll(10)
      game.roll(6)
      game.roll(3)
      16.times{game.roll(0)}
      expect(game.score).to eq 28
    end
  end

end