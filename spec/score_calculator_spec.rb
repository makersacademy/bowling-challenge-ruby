require "score_calculator"

describe ScoreCalculator do 
  it "calculates a score" do
    frames = [[1, 4], [4, 5], [6, 4], [5, 5], [10], [0, 1], [7, 3], [6, 4], [10], [2, 8, 6]] 
    expect(subject.calculate(frames)).to eq 133
  end 
end 
