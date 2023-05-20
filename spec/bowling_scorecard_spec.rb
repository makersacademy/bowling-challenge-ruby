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

  context 'given two consecutive frames' do
    it 'returns an array of the frame scores of two open frames' do
      rolls = [3, 6, 2, 0]
      result = scorecard.calculate_frame_scores(rolls)
      expect(result).to eq [9, 2]        
    end

    it 'returns an array of the frame scores of a spare followed by a gutterball' do
      rolls = [5, 5, 0, 3]
      result = scorecard.calculate_frame_scores(rolls)
      expect(result).to eq [10, 3]    
    end
    
    it 'returns an array of the frame scores of a spare followed by a gutterball' do
      rolls = [5, 5, 0, 3]
      result = scorecard.calculate_frame_scores(rolls)
      expect(result).to eq [10, 3]    
    end

    it 'returns an array of the frame scores of a spare followed by an open frame' do
      rolls = [5, 5, 3, 2]
      result = scorecard.calculate_frame_scores(rolls)
      expect(result).to eq [13, 5]    
    end

    xit 'returns an array of the frame scores of a strike followed by gutterballs' do
      rolls = [10, 0, 0]
      result = scorecard.calculate_frame_scores(rolls)
      expect(result).to eq [10, 0]    
    end

    xit 'returns an array of the frame scores of a strike followed by a gutterball then a regular roll' do
      rolls = [10, 0, 4]
      result = scorecard.calculate_frame_scores(rolls)
      expect(result).to eq [14, 2]    
    end

    xit 'returns an array of the frame scores of a strike followed by a regular roll then a gutterball' do
      rolls = [10, 2, 0]
      result = scorecard.calculate_frame_scores(rolls)
      expect(result).to eq [12, 2]    
    end

    xit 'returns an array of the frame scores of a strike followed by an open frame' do
      rolls = [10, 3, 4]
      result = scorecard.calculate_frame_scores(rolls)
      expect(result).to eq [17, 7]    
    end

    xit 'returns an array of the frame scores of a spare followed by a strike' do
      rolls = [2, 8, 10]
      result = scorecard.calculate_frame_scores(rolls)
      expect(result).to eq [20, 10]    
    end

    xit 'returns an array of the frame scores of a strike followed by a spare' do
      rolls = [10, 2, 8]
      result = scorecard.calculate_frame_scores(rolls)
      expect(result).to eq [20, 10]    
    end

    xit 'returns an array of the frame scores of a spare followed by a spare' do
      rolls = [4, 6, 2, 8]
      result = scorecard.calculate_frame_scores(rolls)
      expect(result).to eq [12, 10]    
    end
  end

  # need three consecutive frame cases? strike strike strike?

  # final frame cases
end
