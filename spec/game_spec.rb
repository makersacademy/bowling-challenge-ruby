# frozen_string_literal: true

# If I score 10 I do not get a second roll

require 'game'

describe Game do
  describe '#pin' do
    it 'pins returns the number of pins knocked down' do
      game = Game.new
      expect(game.pins(4)).to eq 4
    end
  end
  describe 'with no strikes or spares' do
    it 'sums over all the hits' do
      game = Game.new
      20.times { game.pins(3) }
      expect(game.score).to eq 60
    end
  end
end
