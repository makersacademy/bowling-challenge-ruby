describe ".score calculator" do
  it "returns 0 if Gutter Game" do
    game = score_calc([[0,0], [0,0], [0,0], [0,0], [0,0], [0,0], [0,0], [0,0], [0,0], [0,0]])
    expect(game).to eq 0
  end
end