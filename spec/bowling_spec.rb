describe ".score calculator" do
  it "returns 0 if Gutter Game" do
    game = score_calc([[0,0], [0,0], [0,0], [0,0], [0,0], [0,0], [0,0], [0,0], [0,0], [0,0]])
    expect(game).to eq 0
  end

  it "returns correct score for game with no strike or spares" do
    game = score_calc([[1,1], [1,1], [1,1], [1,1], [1,1], [1,1], [1,1], [1,1], [1,1], [1,1]])
    expect(game).to eq 20
  end

  it "returns correct score for game with one spare" do
    game = score_calc([[1,1], [1,1], [1,1], [1,1], [1,1], [1,1], [1,1], [1,1], [5,5], [1,1]])
    expect(game).to eq 29
  end
end