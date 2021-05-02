require 'bowling'

describe Bowling do
  let(:game) { Bowling.new }

  it 'can score a gutter game' do
    20.times { game.roll(0) }
    expect(game.score).to eq 0
  end

  it 'can score a game of all 1s' do
    20.times { game.roll(1) }
    expect(game.score).to eq 20
  end
end
