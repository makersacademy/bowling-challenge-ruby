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

  context 'after multiple frames but fewer than 10 frames' do
    it 'returns correct total score with no spares or strikes' do
      scorecard = BowlingScoring.new
      result = scorecard.calculate([[8, 1], [2, 7], [3, 6], [0, 9], [8, 1], [2, 7], [3, 6], [0, 9], [8, 1]])
      expect(result).to eq(81)
    end

    it 'returns correct total score with spares and strikes' do
      scorecard = BowlingScoring.new
      result = scorecard.calculate([[8, 2], [3, 7], [3, 6], [0, 9], [8, 2], [3, 7], [3, 6], [0, 9], [10, 0]])
      expect(result).to eq(98)
    end
  end

  context 'after a full 10 frame game' do
    it 'returns correct total score with no spares or strikes' do
      scorecard = BowlingScoring.new
      result = scorecard.calculate([[8, 1], [2, 7], [3, 6], [0, 9], [8, 1], [2, 7], [3, 6], [0, 9], [8, 1], [2, 7]])
      expect(result).to eq(90)
    end

    it 'returns correct total score with spares and strikes' do
      scorecard = BowlingScoring.new
      result = scorecard.calculate([[8, 2], [3, 7], [3, 6], [0, 9], [8, 2], [3, 7], [3, 6], [0, 9], [10, 0], [1, 9, 4]])
      expect(result).to eq(122)
    end

  end
end