require './lib/scorecard'

describe ScoreCard do
  subject(:scorecard) { described_class.new }

  it 'gives the score at the start of a scorecard' do
    expect(scorecard.score).to eq 0
  end

  it 'gives the frame number at the start of a scorecard' do
    # Due to it being an array the first frame is 0 and the last is 9 but frame number starts at 1
    expect(scorecard.frame_number).to eq 1
  end

  it "knows a gutter ball on the first roll of the first scorecard scores zero" do
    scorecard.roll(0)
    expect(scorecard.score).to eql(0)
  end

  it "knows a roll of one on the first roll of the first scorecard scores one" do
    scorecard.roll(1)
    expect(scorecard.score).to eql(1)
  end

  # This is taken from the example of the first two rolls on example_ten_pin_scoring.png
  it "knows a roll of one on the first roll and four on the second roll scores a total of five" do
    scorecard.roll(1)
    scorecard.roll(4)
    expect(scorecard.score).to eql(5)
  end

  # This is taken from the example of the first two rolls on example_ten_pin_scoring.png
  it "knows if total of five was rolled on first frame and then rolls of four and five on second frame the total will be fourteen" do
    scorecard.roll(1)
    scorecard.roll(4)
    scorecard.roll(4)
    scorecard.roll(5)
    expect(scorecard.score).to eql(14)
  end

  it 'knows that a gutter game of no pins down means a score of zero' do
    20.times { scorecard.roll(0) }
    expect(scorecard.score).to eq(0)
  end

  it "knows rolls of 10 and 5 on first two roll scores 20 as the first roll is a strike" do
    scorecard.roll(10)
    scorecard.roll(5)
    expect(scorecard.score).to eql(20)
  end

  # This is taken from the example of the full game on example_ten_pin_scoring.png
  it "knows the total score of a game across frames that includes stikes and spares" do
    scorecard.roll(1)
    scorecard.roll(4)
    scorecard.roll(4)
    scorecard.roll(5)
    scorecard.roll(6)
    scorecard.roll(4)
    scorecard.roll(5)
    scorecard.roll(5)
    scorecard.roll(10)
    scorecard.roll(0)
    scorecard.roll(1)
    scorecard.roll(7)
    scorecard.roll(3)
    scorecard.roll(6)
    scorecard.roll(4)
    scorecard.roll(10)
    scorecard.roll(2)
    scorecard.roll(8)
    scorecard.roll(6)
    expect(scorecard.score).to eql(133)
  end

  it "knows how to score a perfect scorecard if frames 1 - 9 are a strike and then all three rolls of the tenth are strikes too " do
    12.times { scorecard.roll(10) }
    expect(scorecard.score).to eql(300)
  end
end
