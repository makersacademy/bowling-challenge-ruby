require 'scorecard'

RSpec.describe Scorecard do
  it 'receives and saves current score' do
    scorecard = Scorecard.new()
    scorecard.input_score(double(:fake_roll, score: 10))
    expect(scorecard.current_roll).to eq 10
  end
end
