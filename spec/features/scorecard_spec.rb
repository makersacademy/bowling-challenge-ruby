describe "scorecard.score" do
  it "Can score a whole game correctly" do
    scorecard = Scorecard.new
    scorecard.roll(1)
    scorecard.roll(4)
    expect(scorecard.score).to eq 5
    scorecard.roll(4)
    scorecard.roll(5)
    expect(scorecard.score).to eq 14
    scorecard.roll(6)
    scorecard.roll(4)
    expect(scorecard.score).to eq 24
    scorecard.roll(5)
    scorecard.roll(5)
    expect(scorecard.score).to eq 39
    scorecard.roll(10)
    expect(scorecard.score).to eq 59
    scorecard.roll(0)
    scorecard.roll(1)
    expect(scorecard.score).to eq 61
    scorecard.roll(7)
    scorecard.roll(3)
    expect(scorecard.score).to eq 71
    scorecard.roll(6)
    scorecard.roll(4)
    expect(scorecard.score).to eq 87
    scorecard.roll(10)
    expect(scorecard.score).to eq 107
    scorecard.roll(2)
    scorecard.roll(8)
    scorecard.roll(6)
    expect(scorecard.score).to eq 133
  end
end
