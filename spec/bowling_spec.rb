require_relative '../lib/bowling.rb'

describe 'bowling' do
  before{@game = Bowling.new}

  it 'can roll a gutter game' do
    20.times{@game.rollball(0)}
    expect(@game.score).to eq(0)
  end

  it 'can roll all 1s' do
    20.times{@game.rollball(1)}
    expect(@game.score).to eq(20)
  end  

end