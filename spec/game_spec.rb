require 'game'

describe Game do
  describe '::start' do
    it 'creates a new game' do
      game = Game.start
      expect(game).to be_a(Game)
    end
  end
end