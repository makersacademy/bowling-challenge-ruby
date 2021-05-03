require 'scorecard'

describe Scorecard do

  before do 
    @game = Scorecard.new
  end

  it 'can score a gutter game' do 
    20.times{ @game.roll(0) }
    expect(@game.score).to eq 0
  end

  it 'can score a game of all ones' do 
    20.times{ @game.roll(1) }
    expect(@game.score).to eq 20
  end

end