require 'bowling'

describe Bowling do
  before do
    @game = Bowling.new
  end

  it 'can create a game' do
    expect(@game).to be_an_instance_of Bowling
  end

  it 'can roll' do
    @game.roll(1)
    @game.roll(1)
    expect(@game.score).to eq 2
  end

  it 'can play a game Gutter game' do
    20.times{@game.roll(0)}
    expect(@game.score).to eq 0
  end

  it 'can play a game of 1' do
    20.times{@game.roll(1)}
    expect(@game.score).to eq 20
  end

  it 'can roll a spare' do
    @game.roll(5)
    @game.roll(5)
    @game.roll(3)
    @game.roll(3)
    16.times{@game.roll(0)}
    expect(@game.score).to eq 19
  end

  it 'can roll 2 spares in a row' do
    @game.roll(5)
    @game.roll(5)
    @game.roll(5)
    @game.roll(5)
    @game.roll(3)
    15.times{@game.roll(0)}
    expect(@game.score).to eq 31
  end
  
  it 'can roll all spares' do
    21.times{@game.roll(5)}
    expect(@game.score).to eq 150
  end

  

  it 'can roll a strike' do
    @game.roll(10)
    @game.roll(5)
    @game.roll(3)
    16.times{@game.roll(0)}
    expect(@game.score).to eq 26
  end

  it 'can roll 2 strike in a row' do
    @game.roll(10)
    @game.roll(10)
    @game.roll(5)
    @game.roll(3)
    17.times{@game.roll(0)}
    expect(@game.score).to eq 51
  end

  it 'can play a perfect game' do
    12.times{@game.roll(10)}
    expect(@game.score).to eq 300
  end

  it 'can play a spare followed by a strike' do
    @game.roll(5)
    @game.roll(5)
    @game.roll(10)
    @game.roll(3)
    @game.roll(3)
    14.times{@game.roll(0)}
    expect(@game.score).to eq 42
  end

  it 'can play a strike followed by a spare' do
    @game.roll(10)
    @game.roll(5)
    @game.roll(5)
    @game.roll(3)
    @game.roll(3)
    14.times{@game.roll(0)}
    expect(@game.score).to eq 39
  end

  it 'can play a random game' do
    @game.roll(1)
    @game.roll(4)
    @game.roll(4)
    @game.roll(5)
    @game.roll(6)
    @game.roll(4)
    @game.roll(5)
    @game.roll(5)
    @game.roll(10)
    @game.roll(0)
    @game.roll(1)
    @game.roll(7)
    @game.roll(3)
    @game.roll(6)
    @game.roll(4)
    @game.roll(10)
    @game.roll(2)
    @game.roll(8)
    @game.roll(6)
    expect(@game.score).to eq 133
  end
end

