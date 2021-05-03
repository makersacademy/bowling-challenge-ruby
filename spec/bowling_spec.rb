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
    17.times { game.roll 0 }
    expect(game.score).to eq 18
  end
end
