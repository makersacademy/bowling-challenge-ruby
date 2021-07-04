require 'bowling'

describe Bowling do
  it { is_expected.to respond_to(:roll).with(1).argument }

  it 'can play a gutter game ' do
    game = Bowling.new
    20.times { game.roll(0) }
    expect(game.score).to eq(0)
  end

  it 'can calculate the score ' do
    game = Bowling.new
    20.times {game.roll(1)}
    expect(game.score).to eq(20)
  end

  it 'can play a strike' do
    game = Bowling.new
    game.roll(10)
    game.roll(2)
    game.roll(3)
    16.times {game.roll(0)}
    expect(game.score).to eq (20)
  end

  it 'can play a spare' do
    game = Bowling.new
    game.roll(5)
    game.roll(5)
    game.roll(5)
    17.times {game.roll(0)}
    expect(game.score).to eq (20)
  end
end

