describe Calculator do

  it "For a turn, will add up the rolls to give a score for that turn" do
    calculator = Calculator.new
    calculator.instance_variable_set(:@rolls, {1 => [1,5]})
    calculator.instance_variable_set(:@turn, 1)
    expect(calculator.score_on_turn).to eq 6
  end

  it "For a turn with a spare, add the next turn's first roll to the  turn score" do
  end

  it "For a turn with a strike, if the next turn has 2 rolls, add both to this turns score" do

  end

  it "For a turn with a strike, if the next turn has 1 roll will add this and one roll of the turn after this" do

  end

  it "Will add up all scores and present the current total score" do

  end

end