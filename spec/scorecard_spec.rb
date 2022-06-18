require 'scorecard'

RSpec.describe Scorecard do
  it 'receives and saves current score' do
    scorecard = Scorecard.new()
    scorecard.input_score(double(:fake_frame, first_roll: 5, second_roll: 3))
    expect(scorecard.frame_total).to eq 8
  end
end
