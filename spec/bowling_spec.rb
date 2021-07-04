require 'bowling'

describe Bowling do
  it 'can create a new game' do
    game = Bowling.new
  end

  it 'can roll to play the game'do
    game = Bowling.new
    expect(game.roll(5)).to eq(5)
  end

  it 'can play a gutter game ' do
    game = Bowling.new
    20.times{game.roll(0)}
    expect(game.score).to eq(0)
  end
end