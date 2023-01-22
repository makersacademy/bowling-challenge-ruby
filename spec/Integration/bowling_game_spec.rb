require 'bowling_game'

RSpec.describe 'Bowling game behaviour' do
  before do
    @game = BowlingGame.new
  end

  it 'roll a gutter game' do
    20.times{@game.roll(0)}

    expect(@game.score).to eq(0)
  end

  it 'can roll all ones' do
    20.times{@game.roll(1)}

    expect(@game.score).to eq(20)
  end

  it 'can roll a spare' do
    @game.roll(5)
    @game.roll(5)
    @game.roll(3)
    17.times{@game.roll(0)}

    expect(@game.score).to eq(16)
  end
end