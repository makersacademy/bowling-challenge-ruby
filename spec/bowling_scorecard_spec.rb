require 'bowling_scorecard'

RSpec.describe "BowlingScorecard" do 
  it "initialises with an array" do 
    scorecard = BowlingScorecard.new([1,2,3,4])
    expect(scorecard).to be_an_instance_of(BowlingScorecard)
  end 
  context "when an array contains a strike score of ten" do
    it "adds the score to its own frame" do
    scorecard = BowlingScorecard.new([10, 2, 3, 4, 2, 10, 6, 2, 5, 5, 3, 2, 3, 3, 1, 2, 3, 4])
    scorecard.set_frames
    expect(scorecard.set_frames).to include([[10], [2,3]])
    end
  end
   context "when an array contains successive scores less than 10" do
     it "adds both scores to their own frame" do
    scorecard = BowlingScorecard.new([1,2,3,4])
    scorecard.set_frames
    expect(scorecard.set_frames).to eq([[[1, 2], [3, 4]]])
    end
  end 
  it "takes a full list of rolls for a game and allocates them all to their frames" do
    scorecard = BowlingScorecard.new([10, 2, 3, 4, 2, 10, 6, 2, 5, 5, 3, 2, 3, 3, 1, 2, 3, 4])
    scorecard.set_frames
    expect(scorecard.sub_total).to eq([[10], [2, 3], [4, 2], [10], [6, 2], [5, 5], [3, 2], [3, 3], [1, 2], [3, 4]])
  end
  it "adds strike bonuses to the frames" do
    scorecard = BowlingScorecard.new([10, 2, 3, 4, 2, 10, 6, 2, 5, 4, 3, 2, 3, 3, 1, 2, 3, 4])
    scorecard.set_frames
    scorecard.apply_bonuses
    expect(scorecard.sub_total).to eq([[15], [2, 3], [4, 2], [18], [6, 2], [5, 4], [3, 2], [3, 3], [1, 2], [3, 4]])
  end 
  it "adds spare bonuses to the frames" do
    scorecard = BowlingScorecard.new([10, 2, 3, 4, 2, 10, 6, 2, 5, 5, 3, 2, 3, 3, 1, 2, 3, 4])
    scorecard.set_frames
    scorecard.apply_bonuses
    expect(scorecard.sub_total).to eq([[15], [2, 3], [4, 2], [18], [6, 2], [8, 5], [3, 2], [3, 3], [1, 2], [3, 4]])
  end 
  it "returns the score total including all bonuses" do 
    scorecard = BowlingScorecard.new([10, 2, 3, 4, 2, 10, 6, 2, 5, 5, 3, 2, 3, 3, 1, 2, 3, 4])
    scorecard.set_frames
    scorecard.apply_bonuses
    expect(scorecard.total).to eq(86)
  end
   it "returns the perfect score for 12 consequetive strikes" do 
    scorecard = BowlingScorecard.new([10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10])
    scorecard.set_frames
    scorecard.apply_bonuses
    expect(scorecard.total).to eq(300)
  end
end 