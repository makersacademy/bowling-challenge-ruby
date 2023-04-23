require 'bowling'

RSpec.describe Scorecard do
  it "initializes the scorecard" do
    scorecard = Scorecard.new
    expect(scorecard.score_so_far).to eq(0)
  end
end
