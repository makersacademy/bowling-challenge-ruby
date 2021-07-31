require 'bowling_scorecard'

describe BowlingScorecard do
  it 'gets the first score' do
    score = 10
    expect(subject.total).to eq 10
  end
end