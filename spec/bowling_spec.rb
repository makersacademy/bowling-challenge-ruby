describe BowlingScore do
  it "returns 0 if Gutter Game" do
    game = BowlingScore.new(
      [[0,0], [0,0], [0,0], [0,0], [0,0], [0,0], [0,0], [0,0], [0,0], [0,0]]
    )
    expect(game.result).to eq 0
  end

  it "returns correct score for game with no strike or spares" do
    game = BowlingScore.new(
      [[1,1], [1,1], [1,1], [1,1], [1,1], [1,1], [1,1], [1,1], [1,1], [1,1]]
    )
    expect(game.result).to eq 20
  end

  it "returns correct score for game with one spare" do
    game = BowlingScore.new(
      [[1,1], [1,1], [1,1], [1,1], [1,1], [1,1], [1,1], [1,1], [5,5], [1,1]]
    )
    expect(game.result).to eq 29
  end

  it "returns correct score for game with two spares" do
    game = BowlingScore.new(
      [[1,1], [1,1], [1,1], [1,1], [5,5], [1,1], [1,1], [1,1], [3,7], [1,1]]
    )
    expect(game.result).to eq 38
  end

  it "returns correct score for game with one strike, no spares" do
    game = BowlingScore.new(
      [[1,1], [1,1], [1,1], [1,1], [1,1], [1,1], [1,1], [1,1], [10], [1,1]]
    )
    expect(game.result).to eq 30
  end

  it "returns correct score for game with two strikes, no spares" do
    game = BowlingScore.new(
      [[1,1], [1,1], [1,1], [1,1], [10], [1,1], [1,1], [1,1], [10], [1,1]]
    )
    expect(game.result).to eq 40
  end

  it "returns correct score for game with two spares in a row, no strikes" do
    game = BowlingScore.new(
      [[5,5], [5,5], [1,1], [1,1], [1,1], [1,1], [1,1], [1,1], [1,1], [1,1]]
    )
    expect(game.result).to eq 42
  end

  it "returns correct score for game with two strikes in a row, no spares" do
    game = BowlingScore.new(
      [[10], [10], [1,1], [1,1], [1,1], [1,1], [1,1], [1,1], [1,1], [1,1]]
    )
    expect(game.result).to eq 49
  end

  it "returns correct result for a realistic game with a mixture of strikes, spares and neither" do
    game = BowlingScore.new(
      [[4,3], [5,5], [6,4], [10], [5,2], [10], [3,7], [4,6], [10], [4,2]]
    )
    expect(game.result).to eq 143
  end

  it "returns correct result for a realistic game with a spare in the 10th frame" do
    game = BowlingScore.new(
      [[4,3], [5,5], [6,4], [10], [5,2], [10], [3,7], [4,6], [10], [4,6,3]]
     )
     expect(game.result).to eq 154
  end

  it "returns correct result for a realistic game with a strike on the first roll of the 10th frame" do
    game = BowlingScore.new(
      [[4,3], [5,5], [6,4], [10], [5,2], [10], [3,7], [4,6], [10], [10,6,3]]
     )
     expect(game.result).to eq 166
  end

  it "returns correct result for a realistic game with two strikes in the 10th frame" do
    game = BowlingScore.new(
      [[4,3], [5,5], [6,4], [10], [5,2], [10], [3,7], [4,6], [10], [10,10,3]]
    )
    expect(game.result).to eq 174
  end

  it "returns a correct result for a realistic game with 0s and 3rd roll in 10th frame" do
    game = BowlingScore.new(
      [[4,3], [5,5], [6,0], [10], [5,2], [10], [3,0], [4,6], [10], [9,1,3]]
    )
    expect(game.result).to eq 122
  end

  it "returns a perfect score for a perfect game" do
    game = BowlingScore.new(
      [[10], [10], [10], [10], [10], [10], [10], [10], [10], [10, 10, 10]]
    )
    expect(game.result).to eq 300
  end

  it "returns a score for an incomplete game without a bonus scoring roll at the end" do
    game = BowlingScore.new(
      [[4,3], [5,5], [6,0], [10], [5,2]]
    )
    expect(game.result).to eq 53
  end

  it "returns a score for an incomplete game with a strike at the end" do
    game = BowlingScore.new(
      [[4,3], [5,5], [6,0], [10], [5,2], [10]]
    )
    expect(game.result).to eq 63
  end
end