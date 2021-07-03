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
end