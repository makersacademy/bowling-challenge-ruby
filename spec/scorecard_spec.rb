require 'scorecard'

RSpec.describe Scorecard do
  it "creates new scorecard object" do
    scorecard = Scorecard.new

    expect(scorecard.total).to eq 0
  end

  it "runs sample game, without strikes or spares, and returns total" do
    scorecard = Scorecard.new
    game = [[1, 5], [5, 2], [9, 0], [1, 1], [3, 3],
            [2, 2], [0, 0], [1, 0], [2, 2], [0, 7]]
    scorecard.add_scores(game)
    expect(scorecard.total).to eq 46
  end
end