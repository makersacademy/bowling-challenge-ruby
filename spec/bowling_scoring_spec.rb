require_relative '../lib/bowling_scoring'

describe BowlingScoring do
  context 'after the first frame' do
    it 'returns a score without a spare or strike' do
      scorecard = BowlingScoring.new([[2, 3]])
      result = scorecard.calculate
      expect(result).to eq(5)
    end
  end

  context 'after second frame' do
    it 'returns total score without a spare or strike' do
      scorecard = BowlingScoring.new([[2, 3], [2, 5]])
      result = scorecard.calculate
      expect(result).to eq(12)
    end

    it 'returns total score with a spare in 1st frame' do
      scorecard = BowlingScoring.new([[2, 8], [2, 5]])
      result = scorecard.calculate
      expect(result).to eq(19)
    end

    it 'returns total score with a strike in 1st frame' do
      scorecard = BowlingScoring.new([[10, 0], [1, 5]])
      result = scorecard.calculate
      expect(result).to eq(22)
    end
  end

  context 'after multiple frames but fewer than 10 frames' do
    it 'returns correct total score with no spares or strikes' do
      scorecard = BowlingScoring.new([[8, 1], [2, 7], [3, 6], [0, 9], [8, 1], [2, 7], [3, 6], [0, 9], [8, 1]])
      result = scorecard.calculate
      expect(result).to eq(81)
    end

    it 'returns correct total score with spares and strikes' do
      scorecard = BowlingScoring.new([[8, 2], [3, 7], [3, 6], [0, 9], [8, 2], [3, 7], [3, 6], [0, 9], [10, 0]])
      result = scorecard.calculate
      expect(result).to eq(98)
    end
  end

  context 'after a full 10 frame game' do
    it 'returns correct total score with no spares or strikes' do
      scorecard = BowlingScoring.new([[8, 1], [2, 7], [3, 6], [0, 9], [8, 1], [2, 7], [3, 6], [0, 9], [8, 1], [2, 7]])
      result = scorecard.calculate
      expect(result).to eq(90)
    end

    it 'returns correct total score with spares and strikes' do
      scorecard = BowlingScoring.new([[8, 2], [3, 7], [3, 6], [0, 9], [8, 2], [3, 7], [3, 6], [0, 9], [10, 0], [1, 9, 4]])
      result = scorecard.calculate
      expect(result).to eq(122)
    end

    it 'returns correct total score with 3 strikes in 10th frame' do
      scorecard = BowlingScoring.new([[8, 2], [3, 7], [3, 6], [0, 9], [8, 2], [3, 7], [3, 6], [0, 9], [10, 0], [10, 10, 10]])
      result = scorecard.calculate
      expect(result).to eq(148)
    end

    it 'returns correct total score for perfect game' do
      scorecard = BowlingScoring.new([[10, 0], [10, 0], [10, 0], [10, 0], [10, 0], [10, 0], [10, 0], [10, 0], [10, 0], [10, 10, 10]])
      result = scorecard.calculate
      expect(result).to eq(300)
    end
  end
end