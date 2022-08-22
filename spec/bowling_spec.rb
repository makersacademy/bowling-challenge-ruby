require 'bowling'

describe 'Boling game logic' do

  before do
    @game = Bowling.new
  end

  it ' can roll gutter game' do
    game = Bowling.new
    20.times{@game.roll(0)}
    expect(@game.score).to eq (0)
  end

  it 'can roll all ones' do
    20.times{@game.roll(1)}
    expect(@game.score).to eq (20)
  end

  it 'roll a spare' do
    @game.roll(5)
    @game.roll(4)
    @game.roll(3)
    17.times{@game.roll(0)}
    expect(@game.score).to eq (15)
  end

end

