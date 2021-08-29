require 'game'
RSpec.describe 'BowlingGame' do

  context '#gutter game' do
    it 'can roll all zero game' do
      game = BowlingGame.new
      20.times{game.roll 0}
      expect(game.score).to eq 0
    end
  end

  context 'all one game' do
    it 'can roll an all one game' do
      game = BowlingGame.new
      20.times{game.roll 1}
      expect(game.score).to eq 20
    end
  end
  
end