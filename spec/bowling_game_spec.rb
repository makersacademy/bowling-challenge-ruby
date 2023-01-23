require 'bowling_game'

RSpec.describe BowlingGame do
  before do
    @game = BowlingGame.new
  end

  it 'is able to roll a 5' do
    @game.roll(5)
    19.times{@game.roll(0)}
    expect(@game.score).to eq(5)
  end

  it 'raise error if the number of pins knocked down exceeds 10' do
    expect{@game.roll(11)}.to raise_error "Invalid number, pins knocked down must be a number from 0 to 10"
  end


  it 'roll a gutter game' do
    20.times{@game.roll(0)}

    expect(@game.score).to eq(0)
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

  it 'can roll a strike' do
    @game.roll(10)
    @game.roll(3)
    @game.roll(4)
    16.times{@game.roll(0)}

    expect(@game.score).to eq(24)
  end

  it 'can roll a perfect game' do
    12.times{@game.roll(10)}

    expect(@game.score).to eq(300)
  end
end