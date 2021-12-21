require 'game'

describe Game do
  let(:game) { Game.new }

  describe '#add_frame' do
    it 'adds a frame consisting of 2 rolls' do
      game.add_rolls(1,4)
      expect(game.frames).to include([1,4])
    end
  end
end