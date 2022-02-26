require_relative '../lib/bowling.rb'

describe 'bowling' do
  before{@game = Bowling.new}

  it 'creates a bowling game' do
    game = Bowling.new
  end

  it 'can roll a gutter game' do
    20.times{@game.rollball(0)}
    expect(@game.score).to eq(0)
  end

  

end