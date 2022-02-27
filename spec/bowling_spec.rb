require_relative '../lib/bowling'

describe "Bowling game" do

  it 'can make a new game' do
    game = Bowling.new
  end

  it 'you can have a gutter game' do 
    game = Bowling.new
    20.times{game.roll(0)}
    expect(game.score).to eq(0)
  end


end