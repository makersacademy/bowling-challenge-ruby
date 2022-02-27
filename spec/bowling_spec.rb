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

end