# frozen_string_literal: true

# If I score 10 I do not get a second roll
require 'rspec'
require 'game'

describe Game do
  it 'can create game' do
    game = Game.new
  end

  it 'can score a gutter game' do
    game = Game.new

    20.times { game.roll(0) }
    expect(game.score).to eq 0
  end

  it 'can roll all ones' do
    game = Game.new

    20.times { game.roll(1) }
    expect(game.score).to eq 20
  end

  it 'Can roll a spare' do
    game = Game.new
    game.roll(5)
    game.roll(5)
    game.roll(3)
    17.times { game.roll(0) }
    expect(game.score).to eq 16
  end

  it 'Can roll a strike' do
    game = Game.new
    game.roll(10)
    game.roll(3)
    game.roll(4)
    16.times { game.roll(0) }
    expect(game.score).to eq 24
  end

  it 'Can roll a perfect game' do
    game = Game.new
    12.times { game.roll(10) }
    expect(game.score).to eq 300
  end
end
