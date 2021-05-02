# frozen_string_literal: true

require 'bowling'

describe Bowling do
  let(:game) { Bowling.new }

  def roll_spare
    game.roll(6)
    game.roll(4)
  end

  it 'can score a gutter game' do
    20.times { game.roll(0) }
    expect(game.score).to eq 0
  end

  it 'can score a game of all 1s' do
    20.times { game.roll(1) }
    expect(game.score).to eq 20
  end

  it 'can score a spare round' do
    roll_spare
    game.roll(3)
    17.times { game.roll(0) }
    expect(game.score).to eq 16
  end

  it 'can score a strike' do
    game.roll(10)
    game.roll(5)
    game.roll(2)
    16.times { game.roll(0) }
    expect(game.score).to eq 24
  end
end
