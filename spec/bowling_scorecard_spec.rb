require 'bowling_scorecard'

RSpec.describe "BowlingScorecard" do 
  it "initialises with an array" do 
    scorecard = BowlingScorecard.new([1,2,3,4])
    expect(scorecard).to be_an_instance_of(BowlingScorecard)
  end 
end 