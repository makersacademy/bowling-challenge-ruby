require 'bowling_scorecard'
describe 'Bowling_scorecard' do
  before do
    @game = Bowling_scorecard.new
  end

  it 'is gutter game when no pins hited' do 
    20.times{@game.roll(0)}
    expect(@game.score).to eq(0)
  end

  it 'can roll all 1' do
    20.times{@game.roll(1)}
    expect(@game.score).to eq(20)
  end

  it 'can be a spare' do 
    @game.roll(6)
    @game.roll(4)
    @game.roll(2)
    17.times{@game.roll(0)}
    expect(@game.score).to eq(14)
  end
  
  it 'can be a strike' do 
    @game.roll(10)
    @game.roll(3)
    @game.roll(5)
    18.times{@game.roll(0)}
    expect(@game.score).to eq(26)
  end

  it 'can be a perfect game' do 
    12.times{@game.roll(10)}
    expect(@game.score).to eq(300)
  end 

  it 'simulate a game' do 
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
    
    expect(@game.score).to eq(133)
  end 

end

