require_relative '../lib/bowling_score_card'

describe "bowling score card class" do
  let(:scorecard) { BowlingScoreCard.new }
  
  context "user rolls 0 for every roll in frame 1" do
    it "gives a score of 0 at the end of the game" do
      roll_many(20, 0)
      expect(scorecard.score).to eq 0
    end
  end


  def roll_many(n, pins)
    n.times { scorecard.roll(pins) }
  end
end


