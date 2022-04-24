require 'bowling_scorecard'

describe Scorecard do
  let(:scorecard) { described_class.new}

  describe 'bowls' do
    it 'lets a player make bowls' do
      expect(scorecard).to respond_to(:bowl).with(1).argument
    end
  end

context 'score' do
  describe 'score' do
    it 'calculates score for finished game' do
      expect(scorecard).to respond_to(:bowls)
    end
  
    it 'returns the score' do
      20.times{ scorecard.bowl(2) }
      expect(scorecard.score).to eq(40)
    end
    
    it 'returns 0 for a gutter game' do
      20.times{ scorecard.bowl(0) }
      expect(scorecard.score).to eq(0)
    end

   context 'when there is a spare' do
     it 'has a spare' do
      scorecard.bowl(5)
      scorecard.bowl(5)
      scorecard.bowl(2)
      17.times{ scorecard.bowl(0) }
      expect(scorecard.score).to eq(14)
      end
    end

  context 'when there is a strike' do
    it 'has a strike' do
      scorecard.bowl(10)
      scorecard.bowl(2)
      scorecard.bowl(2)
      16.times{ scorecard.bowl(0) }
      expect(scorecard.score).to eq(18)
    end
   end
  end
 end
end