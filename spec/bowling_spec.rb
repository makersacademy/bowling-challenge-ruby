require 'bowling'

describe BowlingScore do

  it "returns error if score sheet is not formatted correctly/ empty" do
    score_sheet = []
    score = BowlingScore.new(score_sheet)
    expect { score.final_score }.to raise_error "Score Sheet Provided is Not Readable."

    score_sheet = ["hi", 0, -12, 0, 0, 0, 0, 0, 0, 0, 0]
    score = BowlingScore.new(score_sheet)
    expect { score.final_score }.to raise_error "Score Sheet Provided is Not Readable."
  end

  it "returns perfect game when score is 300" do
    score_sheet = [10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10]
    score = BowlingScore.new(score_sheet)
    expect(score.final_score).to eq "Total Score: 300 (Perfect Game!)"
  end

  it "returns gutter game when score is 0" do
    score_sheet = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    score = BowlingScore.new(score_sheet)
    expect(score.final_score).to eq "Total Score: 0 (Gutter Game)"
  end

  it "returns the correct score for a game with no strikes or spares" do
    score_sheet = [1, 2, 3, 6, 4, 2, 0, 1, 6, 2, 3, 4, 1, 7, 8, 0, 9, 0, 1, 3]
    score = BowlingScore.new(score_sheet)
    expect(score.final_score).to eq "Total Score: 63"
  end

  it "returns the correct score for a game with some strikes and spares" do
    score_sheet = [1, 4, 4, 5, 6, 4, 5, 5, 10, 0, 1, 7, 3, 6, 4, 10, 2, 8, 6]
    score = BowlingScore.new(score_sheet)
    expect(score.final_score).to eq "Total Score: 133"
  end

end
