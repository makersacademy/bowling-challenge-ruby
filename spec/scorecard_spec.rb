require './lib/scorecard'

describe ScoreCard do

  subject(:scorecard) { described_class.new }

  it 'gives the score at the start of a game' do
    expect(scorecard.score).to eq 0
  end

  it 'gives the frame number at the start of a game' do
    # Due to it being an array the first frame is 0 and the last is 9
    expect(scorecard.frame_number).to eq 0
  end

  it "knows a gutter ball on the first roll of the first game scores zero" do
    scorecard.roll(0)
    expect(scorecard.score).to eql(0)
  end

  it "knows a roll of one on the first roll of the first game scores one" do
    scorecard.roll(1)
    expect(scorecard.score).to eql(1)
  end

end
