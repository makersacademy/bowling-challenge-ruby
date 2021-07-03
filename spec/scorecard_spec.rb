require '../scorecard'

describe BowlingScore do
  before do
    @game = BowlingScore.new
  end

  it 'can have a gutter game' do
    20.times { @game.roll(0) }
    expect(@game.score).to eq(0)
  end

  it 'can roll all ones' do
    20.times { @game.roll(1) }
    expect(@game.score).to eq(20)
  end

  it 'adds bonus points for a spare' do
    @game.roll(5)
    @game.roll(5)
    @game.roll(8)
    @game.roll(1)
    16.times { @game.roll(0) }
    expect(@game.score).to eq(27)
  end

  it 'adds bonus points for a strike' do
    @game.roll(10)
    @game.roll(6)
    @game.roll(2)
    17.times { @game.roll(0) }
    expect(@game.score).to eq(26)
  end

  it 'can score a perfect game' do
    12.times { @game.roll(10) }
    expect(@game.score).to eq(300)
  end

  it 'has 10 frames' do
    5.times { @game.roll(10) }
    @game.roll(2)
    @game.roll(3)
    3.times { @game.roll(10) }
    @game.roll(5)
    @game.roll(2)
    5.times { @game.roll(10) }
    expect(@game.score).to eq(211)
  end

  it 'allows 3 total shots in the 10th frame when the first/second is a strike/spare' do
    10.times { @game.roll(10) }
    @game.roll(5)
    @game.roll(3)
    expect(@game.score).to eq(283)
  end

  it 'does not allow a 3rd shot in the 10th frame when there is no strike/spare' do
    9.times { @game.roll(10) }
    @game.roll(5)
    @game.roll(3)
    @game.roll(3)
    @game.roll(3)
    expect(@game.score).to eq(261)
  end
end