require 'bowling_scorecard'

RSpec.describe BowlingScorecard do
  let(:scorecard) { BowlingScorecard.new }

  it 'constructs' do
    expect(scorecard.frame_scores).to eq []
  end
end
