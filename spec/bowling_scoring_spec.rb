require_relative '../lib/bowling_scoring'

describe BowlingScoring do
  context 'after the first frame' do
    it 'returns a score without a spare or strike' do
      scorecard = BowlingScoring.new
      result = scorecard.calculate([[2, 3]])
      expect(result).to eq(5)
    end
  end

  context 'after second frame' do
    it 'returns total score without a spare or strike' do
      scorecard = BowlingScoring.new
      result = scorecard.calculate([[2, 3], [2, 5]])
      expect(result).to eq(12)
    end

    it 'returns total score with a spare in 1st frame' do
      scorecard = BowlingScoring.new
      result = scorecard.calculate([[2, 8], [2, 5]])
      expect(result).to eq(19)
    end

    it 'returns total score with a strike in 1st frame' do
      scorecard = BowlingScoring.new
      result = scorecard.calculate([[10, 0], [1, 5]])
      expect(result).to eq(22)
    end
  end
end