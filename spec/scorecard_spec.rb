# frozen_string_literal: true

require 'scorecard'

describe Scorecard do
  context 'Score without bonuses' do
    it 'returns a score' do
      score = Scorecard.new([[3, 4], [5, 3], [4, 5], [5, 3], [1, 0], [3, 6], [4, 4], [3, 5], [3, 3], [7, 2]])
      expect(score.final_score).to eq 73
    end
  end

  context 'with strikes' do
    it 'returns a score of 300' do
      score = Scorecard.new([[10], [10], [10], [10], [10], [10], [10], [10], [10], [10, 10, 10]])
      expect(score.final_score).to eq 300
    end

    it 'returns a score of 257' do
      score = Scorecard.new([[5, 3], [5, 4], [10], [10], [10], [10], [10], [10], [10], [10, 10, 10]])
      expect(score.final_score).to eq 257
    end
  end

  context 'with spares' do
    it 'returns a score of 142' do
      score = Scorecard.new([[5, 5], [5, 5], [5, 5], [5, 5], [5, 5], [5, 5], [5, 5], [5, 5], [5, 5], [5, 5, 5]])
      expect(score.final_score).to eq 150
    end
  end

  context 'with no pins knocked over' do
    it 'returns a score of 0' do
      score = Scorecard.new([[0], [0], [0], [0], [0], [0], [0], [0], [0], [0, 0]])
      expect(score.final_score).to eq 0
    end
  end
end
