require 'scorecard'


RSpec.describe Scorecard do
  let(:scorecard) { Scorecard.new }

  it "scores a gutter game correctly" do
    20.times { scorecard.roll(0) }
    expect(scorecard.score).to eq(0)
  end

  it "calculates correct score when there are no strikes or spares" do
      20.times { scorecard.roll(4) }
      expect(scorecard.score).to eq (80)
  end

  it "calculates the correct score for a game with only spares" do
    10.times do
      scorecard.roll(5)
      scorecard.roll(5)
    end
    scorecard.roll(5) 
    expect(scorecard.score).to eq(150)
  end

  it "calculates the correct score for a perfect game" do
    12.times { scorecard.roll(10) }
    expect(scorecard.score).to eq (300)
  end

  xit "calculates the correct score for a game with a mix of strikes and spares" do
    rolls = [10, 4, 6, 7, 2, 10, 5, 5, 0, 10, 10, 2, 8, 9, 1, 10, 10, 8, 2]
    rolls.each { |pins| scorecard.roll(pins) }
    expect(scorecard.score).to eq(199)
  end
end


