require 'bowling_game'

describe BowlingGame do
  describe '.all' do
    it 'Can create game' do
      expect(subject).to be_a BowlingGame
    end

    it 'Can roll gutter game' do
      game = BowlingGame.new
      game.roll(0)
      expect(game.score) == 0
    end
  end
end