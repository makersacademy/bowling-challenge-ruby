require 'rspec'
require 'bowling_game'

describe 'Bowling game' do

  before do
    @game = BowlingGame.new
  end

  it 'can roll a gutter game' do

    20.times{@game.roll 0}
    expect(@game.score). to eq 0
  end

  it 'Can roll all ones' do
    20.times{@game.roll 1}
    expect(@game.score). to eq 20
  end

  it 'can roll a spare' do
    @game.roll 5
    @game.roll 5
    @game.roll 3
    17.times{@game.roll 0}
    expect(@game.score).to eq 16
  end

  it 'Can roll a strike' do
    @game.roll 10
    @game.roll 4
    @game.roll 3
    17.times{@game.roll 0}
    expect(@game.score).to eq 24
  end

  it 'can roll a perfect score' do
    12.times{@game.roll 10}
    expect(@game.score).to eq 300
  end

  it 'Can roll all spares' do
    21.times{@game.roll 5}
    expect(@game.score).to eq 150
  end
end
