require 'bowling_score'

describe BowlingScore do
  subject { BowlingScore.new([[6, 4], [1, 3], [3, 5], [2, 0], [10, 0], [10, 0], [1, 9], [3, 5], [2, 0], [0, 0]]) }

  it 'returns the user rolls' do
    expect(subject.user_rolls).to eq([[6, 4], [1, 3], [3, 5], [2, 0], [10, 0], [10, 0], [1, 9], [3, 5], [2, 0], [0, 0]])
  end

  it 'returns the total score' do
    expect(subject.total_score).to eq(89)
  end

  it 'returns scores per frames while detecting spares and strikes' do
    expect(subject.scores).to eq([11, 4, 8, 2, 21, 20, 13, 8, 2, 0])
  end
end