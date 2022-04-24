require 'bowling_scorecard'

describe Scorecard do
  let(:scorecard) { described_class.new}

  describe 'roll' do
    it 'lets players make rolls' do
      expect(scorecard).to respond_to(:roll).with(1).argument
    end
  end

  describe 'score' do
    it 'can calculate score for finished game' do
      expect(scorecard).to respond_to(:score)
    end
  end
  
  context 'in a game' do
    it 'returns the score' do
      10.times{ scorecard.roll(2) }
      expect(scorecard.score).to eq(20)
    end
  end
    
  context 'in a gutter game' do
    it 'returns 0 for a gutter game' do
      10.times{ scorecard.roll(0) }
      expect(scorecard.score).to eq(0)
    end
  end
end
