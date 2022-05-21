require 'scoring_test'

describe 'calculate_score' do
  it 'calculates score without bonuses' do
    user_input = [
      [3, 5], 
      [9, 0], 
      [5, 4], 
      [2, 3],
      [5, 4],
      [1, 6],
      [0, 9], 
      [8, 1],
      [9, 0],
      [2, 1]
      ]

    expect(calculate_score(user_input)).to eq 77
  end

  it 'calculates score with strike bonus' do
    user_input = [
      [3, 5], 
      [10, 0], # strike - adds next [5,4]
      [5, 4]
    ]

    expect(calculate_score(user_input)).to eq 36
  end

  it 'calculates score with spare bonus' do
    user_input = [
      [3, 4],
      [8, 2], # spare - adds next [5, 4]
      [5, 4]
    ]

    expect(calculate_score(user_input)).to eq 31
  end

  it 'calculates the score with a strike and a spare' do

  end

  it 'calculates the score with a spare and a strike' do

  end

  it 'calculates the score with all zero scores' do

  end

  it 'calculates the score with 10th frame strike' do

  end

  it 'calculates the score with 10th frame spare' do

  end

end