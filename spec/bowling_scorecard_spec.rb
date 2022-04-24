require 'bowling_scorecard'

describe Scorecard do
  let(:scorecard) { described_class.new}

  describe 'bowls' do
    it 'lets a player make bowls' do
      expect(scorecard).to respond_to(:bowl).with(1).argument
    end
  end

  describe 'score' do
    it 'can calculate score for finished game' do
      expect(scorecard).to respond_to(:bowls)
    end
  
    it 'returns the score' do
      10.times{ scorecard.bowl(2) }
      expect(scorecard.score).to eq(20)
    end
    
    it 'returns 0 for a gutter game' do
      10.times{ scorecard.bowl(0) }
      expect(scorecard.score).to eq(0)
    end

  context 'when there is a spare' do
    it 'has a spare' do
      scorecard.bowl(5)
      scorecard.bowl(5)
      scorecard.bowl(2)
      7.times{ scorecard.bowl(0) }
      expect(scorecard.score).to eq(14)
      end
    end
  end
end
