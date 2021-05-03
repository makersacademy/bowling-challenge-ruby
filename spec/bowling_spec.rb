require 'bowling'

describe Bowling do
  let(:game) { Bowling.new }

  it 'can rol a gutter game' do
    20.times { game.roll(0) }
    expect(game.score).to eq 0
  end
end
