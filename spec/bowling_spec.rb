require 'bowling'

RSpec.describe 'Bowling' do
  it 'should accept an array as the scorecard' do
    scorecard = Bowling.new([[3, 4], [5, 3]])
    result = scorecard.frames
    expect(result).to eq [[3, 4], [5, 3]]
  end
  it 'sum totals a frame' do
    scorecard = Bowling.new([[3, 4], [5, 3]])
    result = scorecard.sum_frame(scorecard.frames[0])
    expect(result).to eq 7
  end
  it 'returns the total score' do
    scorecard = Bowling.new([[3, 4], [5, 3]])
    result = scorecard.total
    expect(result).to eq 15
  end
  it 'should identify if a frame contains a strike' do
    scorecard = Bowling.new([[1, 1], [10, 0], [2, 3]])
    result = scorecard.strike?(scorecard.frames[1])
    expect(result).to eq true
  end
  it 'should add the strike bonus points correctly' do
    scorecard = Bowling.new([[1, 1], [10, 0], [2, 3]])
    result = scorecard.total
    expect(result).to eq 22
  end
  it 'should identify if a frame contains a spare' do
    scorecard = Bowling.new([[1, 1], [10, 0], [2, 3], [7, 3]])
    result = scorecard.spare?(scorecard.frames[3])
    expect(result).to eq true
  end
  it 'should identify the first roll of a frame' do
    scorecard = Bowling.new([[1, 1], [10, 0], [2, 3], [7, 3]])
    result = scorecard.first_roll(scorecard.frames[2])
    expect(result).to eq 2
  end
  it 'should add the spare bonus points correctly' do
    scorecard = Bowling.new([[1, 1], [5, 5], [2, 3]])
    result = scorecard.total
    expect(result).to eq 19
  end
  it 'should return the correct score' do
    scorecard = Bowling.new([[1, 2], [3, 4], [5, 1], [2, 3], [4, 5], [1, 2], [3, 4], [5, 1], [2, 3], [4, 5]])
    result = scorecard.total
    expect(result).to eq 60
  end
  it 'should return the correct score, given a strike in the 10th frame' do
    scorecard = Bowling.new([[1, 2], [3, 4], [5, 1], [2, 3], [4, 5], [1, 2], [3, 4], [5, 1], [2, 3], [10, 0], [10, 10]])
    result = scorecard.total
    expect(result).to eq 81
  end
  it 'should return the correct score, given a spare in the 10th frame' do
    scorecard = Bowling.new([[1, 2], [3, 4], [5, 1], [2, 3], [4, 5], [1, 2], [3, 4], [5, 1], [2, 3], [5, 5], [10]])
    result = scorecard.total
    expect(result).to eq 71
  end
  it 'should return a score of 300 given a perfect game' do
    scorecard = Bowling.new([[10, 0], [10, 0], [10, 0], [10, 0], [10, 0], [10, 0], [10, 0], [10, 0], [10, 0], [10, 0], [10, 10]])
    result = scorecard.total
    expect(result).to eq 300
  end
end