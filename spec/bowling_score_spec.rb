require 'bowling_score'

describe BowlingScore do
  before (:each) do
    @new_game = described_class.new
  end

  it 'responds to the score method' do
    expect(@new_game).to respond_to(:score)
  end

  it 'returns 1 when 1 pin is knocked down' do
    expect(@new_game.score(1)).to eq 1
  end

  it 'should add 1 to the scorecard when 1 pin is knocked down' do
    @new_game.score(1)
    expect(@new_game.scorecard).to eq 1
  end

  # it 'should return 6 when given 2 rolls (1 + 5)' do

end