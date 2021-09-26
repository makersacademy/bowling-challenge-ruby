require 'bowling_score'

describe BowlingScore do
  subject { BowlingScore.new([[3, 4], [1, 3], [3, 5], [2, 0], [0, 0], [3, 4], [1, 3], [3, 5], [2, 0], [0, 0]]) }

  it 'returns the user rolls' do
    expect(subject.user_rolls).to eq([[3, 4], [1, 3], [3, 5], [2, 0], [0, 0], [3, 4], [1, 3], [3, 5], [2, 0], [0, 0]])
  end

  it 'returns the total score' do
    expect(subject.score).to eq(42)
  end
end