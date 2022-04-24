require './lib/bowling_scorecard'

describe Scorecard do
  scorecard = Scorecard.new
  describe 'roll' do
    it 'lets players to make rolls' do
      expect(scorecard).to respond_to(:roll).with(1).argument
    end
  end

  describe 'score' do
    it 'can calculate score for finished game' do
      expect(scorecard).to respond_to(:score)
    end
  end

  context 'in a game' do
    it 'returns 0 for a gutter game' do
      10.times{ scorecard.roll(0) }
      expect(scorecard.score).to eq(0)
    end
  end
end
