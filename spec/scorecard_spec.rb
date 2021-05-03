require 'scorecard'

describe Scorecard do

  let(:game) { Scorecard.new }

  it 'can score a gutter game' do 
    20.times{ game.roll(0) }
    expect(game.score).to eq 0
  end

  it 'can score a game of all ones' do 
    20.times{ game.roll(1) }
    expect(game.score).to eq 20
  end

  it 'can score a spare' do
    game.roll(6)
    game.roll(4)
    game.roll(5)
    17.times{ game.roll(0) }
    expect(game.score).to eq 20
  end

end