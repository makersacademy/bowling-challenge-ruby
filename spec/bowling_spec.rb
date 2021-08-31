require 'bowling'

describe Bowling do
  let(:game) { Bowling.new }

  it 'can score a gutter game' do
    20.times { game.roll(0) }
    expect(game.score).to eq 0
  end

  it 'can score a game of all 1 scores' do
    20.times { game.roll(1) }
    expect(game.score).to eq 20
  end

  it 'can score a spare' do
    game.roll(7)
    game.roll(3)
    game.roll(4)
    17.times { game.roll(0) }
    expect(game.score).to eq 18
  end

  it 'can score a strike' do
    game.roll(10)
    game.roll(7)
    game.roll(5)
    16.times { game.roll(0) }
    expect(game.score).to eq 34
  end

  it 'can play a perfect game' do
    12.times { game.roll(10) }
    expect(game.score).to eq 300
  end
end
