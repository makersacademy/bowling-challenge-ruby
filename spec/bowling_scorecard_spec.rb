require 'bowling_scorecard'

RSpec.describe BowlingScorecard do
  let(:scorecard) { BowlingScorecard.new }

  it 'constructs' do
    expect(scorecard.frame_scores).to eq []
  end

  describe '#calculate_frame_scores' do
    context 'given one frame' do
      it 'returns [0] for an empty frame (two gutterballs)' do
        rolls = [0, 0]
        result = scorecard.calculate_frame_scores(rolls)
        expect(result).to eq [0]
      end

      it 'returns the result of an open frame (pins left standing)' do
        rolls = [0, 1]
        result = scorecard.calculate_frame_scores(rolls)
        expect(result).to eq [1]        
      end

      it 'returns the result of a different open frame (pins left standing)' do
        rolls = [5, 3]
        result = scorecard.calculate_frame_scores(rolls)
        expect(result).to eq [8]        
      end

      it 'returns 10 for a strike' do
        rolls = [10]
        result = scorecard.calculate_frame_scores(rolls)
        expect(result).to eq [10]        
      end
      
      it 'returns 10 for a spare' do
        rolls = [3, 7]
        result = scorecard.calculate_frame_scores(rolls)
        expect(result).to eq [10]        
      end

    end
  end
end
