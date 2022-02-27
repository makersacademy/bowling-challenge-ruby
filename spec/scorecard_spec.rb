require './lib/scorecard'

describe ScoreCard do
  subject(:scorecard) { described_class.new }

  it 'gives the score at the start of a game' do
    expect(scorecard.score).to eq 0
  end
end
