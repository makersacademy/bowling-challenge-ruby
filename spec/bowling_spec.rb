require 'bowling'

describe Bowling do
  it 'can score a gutter game' do
    game = Bowling.new
    10.times { game.roll(0) }
    expect(game.score).to eq 0
  end
end
