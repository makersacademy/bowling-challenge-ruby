require 'bowling'

describe 'Bowling Game Rules' do

  it 'can roll a gutter game' do
    game = Bowling.new
    20.times{game.roll 0}
    expect(game.score).to eq 0
  end

  it 'can roll all ones' do
    game = Bowling.new
    20.times{game.roll 1}
    expect(game.score).to eq 20
  end

end 
