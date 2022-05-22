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
      [8, 2], # spare - adds next [5]
      [5, 4]
    ]
    expect(calculate_score(user_input)).to eq 31
  end

  it 'calculates the score with a strike and a spare' do
    user_input = [
      [3, 4],
      [10,0], # strike - adds next [8,2]
      [8, 2], # spare - adds next [5]
      [5, 4]
    ]
    expect(calculate_score(user_input)).to eq 51
  end

  it 'calculates the score with a spare and a strike' do
    user_input = [
      [8, 2], # spare - adds next [3]
      [3, 4],
      [10, 0], # strike - adds next [5,4]
      [5, 4]
    ]
    expect(calculate_score(user_input)).to eq 48
  end

  it 'calculates the score with all zero scores' do
    user_input = [
      [0, 0],
      [0, 0],
      [0, 0],
      [0, 0]
    ]
    expect(calculate_score(user_input)).to eq 0 
  end

  it 'calculates the score with 10th frame strike, 
    followed by 2 bonus rolls (strike each)' do
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
      [10, 0], # 10th frame strike
      [10, 10] # 2 bonus rolls, strike each
      ]
    expect(calculate_score(user_input)).to eq 104
  end

  it 'calculates the score with 10th frame strike, 
    followed by 2 bonus rolls (totalling 10)' do
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
      [10, 0], # 10th frame strike
      [2, 8] # 2 bonus rolls, strike 
      ]
    expect(calculate_score(user_input)).to eq 94
  end

  it 'calculates the score with 10th frame spare, 
    followed by 1 bonus roll' do
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
      [5, 5], # 10th frame spare
      [2, 0] # 1 bonus roll
      ]
    expect(calculate_score(user_input)).to eq 86
  end

  it 'calculates the score with 10th frame spare, 
    followed by 1 bonus roll (with a strike)' do
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
      [5, 5], # 10th frame spare
      [10, 0] # 1 bonus roll, strike
      ]
    expect(calculate_score(user_input)).to eq 94
  end

end