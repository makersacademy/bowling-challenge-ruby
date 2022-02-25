# frozen_string_literal: true

describe Calculator do
  it 'For a turn, will add up the rolls to give a score for that turn' do
    calculator = Calculator.new
    calculator.instance_variable_set(:@rolls, { 1 => [1, 5] })
    calculator.instance_variable_set(:@checking_turn, 1)
    expect(calculator.score_on_turn).to eq 6
  end

  it "For a turn with a spare, add the next turn's first roll to the  turn score" do
    rolls = { 1 => [1, 9], 2 => [3] }
    calculator2 = Calculator.new
    calculator2.instance_variable_set(:@strikes, { 1 => '/' })
    calculator2.instance_variable_set(:@rolls, rolls)
    calculator2.instance_variable_set(:@checking_turn, 1)
    expect(calculator2.strikes_scores).to eq 3
  end

  it 'For a turn with a strike, if the next turn has 2 rolls, add both to this turns score' do
    rolls = { 1 => [1, 9], 2 => [3, 2] }
    calculator2 = Calculator.new
    calculator2.instance_variable_set(:@strikes, { 1 => 'X' })
    calculator2.instance_variable_set(:@rolls, rolls)
    calculator2.instance_variable_set(:@checking_turn, 1)
    expect(calculator2.strikes_scores).to eq 5
  end

  it 'For a turn with a strike, if the next turn has 1 roll will add this and one roll of the turn after this' do
    rolls = { 1 => [1, 9], 2 => [10], 3 => [5] }
    calculator = Calculator.new
    calculator.instance_variable_set(:@strikes, { 1 => 'X' })
    calculator.instance_variable_set(:@rolls, rolls)
    calculator.instance_variable_set(:@checking_turn, 1)
    expect(calculator.strikes_scores).to eq 15
    rolls = { 1 => [1, 9], 2 => [10] }
    calculator2 = Calculator.new
    calculator2.instance_variable_set(:@strikes, { 1 => 'X' })
    calculator2.instance_variable_set(:@rolls, rolls)
    calculator2.instance_variable_set(:@checking_turn, 1)
    expect(calculator2.strikes_scores).to eq 10
  end

  it 'The sum of scores will add up the scores' do
    calculator2 = Calculator.new
    calculator2.instance_variable_set(:@scores_per_turn, { 1 => 3, 2 => 5, 3 => 7 })
    expect(calculator2.sum_of_scores).to eq 15
  end

  it 'Will add up all scores and present the current total score' do
    rolls = { 1 => [1, 7], 2 => [10], 3 => [5, 2] }
    calculator = Calculator.new
    @turn = 4
    @strikes = { 2 => 'X' }
    @rolls = rolls
    expect(calculator.calculate_score(@rolls, @strikes, @turn)).to eq 32
  end

  it 'If it is not a strike, no extra strike score is added' do
    rolls = { 1 => [1, 9], 2 => [10], 3 => [5] }
    calculator = Calculator.new
    calculator.instance_variable_set(:@strikes, {})
    calculator.instance_variable_set(:@rolls, rolls)
    calculator.instance_variable_set(:@checking_turn, 1)
    expect(calculator.strikes_scores).to eq 0
  end
end
