require_relative '../lib/bowling'

describe "Bowling game" do

    before do 
      @game = Bowling.new
    end
  
    it 'can have a gutter game' do 
    20.times{@game.roll(0)}
    expect(@game.score).to eq(0)
  end

  it 'can roll all 1s' do
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
    @game.roll(5)
    @game.roll(3)
    16.times{@game.roll(0)}
    expect(@game.score).to eq(26)
  end
end