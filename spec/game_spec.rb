# frozen_string_literal: true

require_relative '../lib/game'

describe Game do
  it('can create a new game') do
    Game.new
  end

  it('can roll a gutter game') do
      game = Game.new
      20.times{game.roll(0)}
      expect(game.score).to eq 0
  end
end
