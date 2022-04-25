require 'scoresheet'

describe Scoresheet do
  context 'Gutter game' do
    it 'total score of 0' do
      score = Scoresheet.new([[0], [0], [0], [0], [0], [0], [0], [0], [0], [0, 0]])
      expect(score.total_score).to eq 0
    end
  end

  context 'Perfect score' do
    it 'total score of 300' do
      score = Scoresheet.new([[10], [10], [10], [10], [10], [10], [10], [10], [10], [10, 10, 10]])
      expect(score.total_score).to eq 300
    end
  end

  context 'Score with no bonuses' do
    it 'returns a score' do
      score = Scoresheet.new([[5, 3], [4, 4], [3, 5], [5, 3], [0, 1], [4, 5], [6, 3], [4, 5], [3, 3], [7, 2]])
      expect(score.total_score).to eq 75
    end
  end
end