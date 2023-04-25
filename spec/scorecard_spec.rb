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

  it "collects scores from user" do
    io = double :io
    
    scorecard = Scorecard.new(io)
    x = 1
    10.times do
      expect(io).to receive(:puts).with (":::Frame #{x}:::")
      expect(io).to receive(:puts).with ("Enter score 1:")
      expect(io).to receive(:gets).and_return(1)
      expect(io).to receive(:puts).with ("Enter score 2:")
      expect(io).to receive(:gets).and_return(1)
      x += 1
    end
    scorecard.collect_scores_from_user
    expect(scorecard.total).to eq 20
  end
end