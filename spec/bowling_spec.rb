# frozen_string_literal: true

require 'bowling'

describe Bowling do
  let(:game) { Bowling.new }

  it 'can roll a gutter game' do
    20.times { game.roll(0) }
    expect(game.score).to eq 0
  end

  it 'can roll a spare' do
    game.roll(4)
    game.roll(6)
    game.roll(4)
    17.times { game.roll(0) }
    expect(game.score).to eq 18
  end

  it 'can roll a strike' do
    game.roll(10)
    game.roll(7)
    game.roll(5)
    16.times { game.roll(0) }
    expect(game.score).to eq 34
  end

  it 'can roll a perfect game' do
    12.times{ game.roll(10) }
    expect(game.score).to eq 300
  end
  
  it 'can roll a strike in the 10th frame' do
    18.times { game.roll(6) }
    game.roll(10)
    game.roll(3)
    game.roll(2)
    expect(game.score).to eq 123
  end

  it 'can roll a spare in the 10th frame' do
    18.times { game.roll(6) }
    game.roll(8)
    game.roll(2)
    game.roll(3)
    expect(game.score).to eq 121
  end

end
