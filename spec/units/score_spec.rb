# frozen_string_literal: true

require 'score'

describe Score do
  let(:straight_game) { [2, 3, 4, 1, 5, 0, 4, 1, 2, 3] }
  let(:gutter_game) { [0, 0, 0, 0, 0, 0, 0, 0, 0, 0] }
  let(:perfect_game) { [10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10] }
  let(:spare_game) { [2, 3, 5, 5, 3, 2, 1, 4, 3, 2, 1, 4] }

  it 'takes an array as initialized input' do
    score = Score.new(input_scores: straight_game)
    expect(score.input_scores).to be_an(Array)
  end

  context 'edge cases' do
    it 'returns score 0 from a gutter game' do
      score = Score.new(input_scores: gutter_game)
      expect(score.calculate_score).to eq 0
    end

    it 'returns score 300 from a perfect game' do
      score = Score.new(input_scores: perfect_game)
      expect(score.calculate_score).to eq 300
    end
  end

  context 'straight_game' do
    it 'can calculate when no strikes or spares' do
      score = Score.new(input_scores: straight_game)
      expect(score.calculate_score).to eq 25
    end
  end
end
