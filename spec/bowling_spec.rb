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

end
