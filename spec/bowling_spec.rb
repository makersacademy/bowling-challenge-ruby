require 'bowling'

describe Bowling do

  let(:game) { Bowling.new }

  it 'can contain two rolls' do
    game.roll(3)
    game.roll(4)
    expect(game.rolls.length).to eq 2
  end

  it 'scores two rolls' do
    game.roll(3)
    game.roll(4)
    expect(game.score).to eq 7
  end

  it 'scores a spare' do
    game.roll(6)
    game.roll(4)
    game.roll(1)
    game.roll(1)
    expect(game.score).to eq 13
  end

  it 'scores a strike' do
    game.roll(10)
    game.roll(3)
    game.roll(4)
    expect(game.score).to eq 24
  end

  it 'scores multiple strikes' do
    3.times { game.roll(10) }
    game.roll(3)
    game.roll(4)
    expect(game.score).to eq 77
  end

  it 'scores a perfect game' do
    12.times { game.roll(10) }

    expect(game.score).to eq 300
  end

  it 'misses a perfect name' do
    9.times { game.roll(10) }
    game.roll(3)
    game.roll(4)

    expect(game.score).to eq 257
  end
end
