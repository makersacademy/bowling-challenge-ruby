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
end