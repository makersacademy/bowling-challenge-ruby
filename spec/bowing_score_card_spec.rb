require_relative '../lib/bowling_score_card'

describe "bowling score card class" do
  let(:scorecard) { BowlingScoreCard.new }

  context "user rolls 0 for every roll in 10 frame game" do
    it "gives a score of 0 at the end of the game" do
      roll_n_times(20, 0)
      expect(scorecard.score).to eq 0
    end
  end

  context "user rolls 1 for every roll (20) in 10 frame game" do
    it "gives a score of 20 at the end of the game" do
      roll_n_times(20, 1)
      expect(scorecard.score).to eq 20
    end
  end

# rspec helper method
  def roll_n_times(n, pins_down)
    n.times { scorecard.roll(pins_down) }
  end
end


