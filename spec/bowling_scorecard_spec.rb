require 'bowling_scorecard'

RSpec.describe "BowlingScorecard" do 
  it "initialises with an array" do 
    scorecard = BowlingScorecard.new([1,2,3,4])
    expect(scorecard).to be_an_instance_of(BowlingScorecard)
  end 
  context "when an array contains a strike score of ten" do
    it "adds the score to its own frame" do
    scorecard = BowlingScorecard.new([10, 10, 4, 2, 10, 6, 2, 5, 5, 3, 2, 10, 4, 2, 10, 2, 3, 6, 1])
    scorecard.set_frames
    expect(scorecard.set_frames[0]).to include([[10],[10]])
    end
  end 
end 