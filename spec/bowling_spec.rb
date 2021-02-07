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

end
