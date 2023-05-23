require 'scorecard'

RSpec.describe ScoreCard do
  context 'final format method' do
    it "Returns early if the ScoreCard doesn't have 10 Frames" do
      scorecard = ScoreCard.new
      expect(scorecard.final_format).to eq "Your game isn't over yet! You have 10 frames left"
    end
  end
end