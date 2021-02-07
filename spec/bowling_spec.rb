require 'bowling'

describe 'A bowling game' do

  before do
    @game = Bowling.new
  end

  it 'can make a new game' do
    @game = Bowling.new
  end

  it 'can roll a gutter score' do
    20.times{@game.roll(0)}
    expect(@game.score).to eq 0
  end

  it 'can roll all one scores' do
    20.times{@game.roll(1)}
    expect(@game.score).to eq 20
  end

  it 'can roll a spare' do
    @game.roll(5)
    @game.roll(5)
    @game.roll(3)
    17.times{@game.roll(0)}
    expect(@game.score).to eq 16
  end

  it 'can roll a strike' do
    @game.roll(10)
    @game.roll(3)
    @game.roll(4)
    16.times{@game.roll(0)}
    expect(@game.score).to eq 24
  end 


end
