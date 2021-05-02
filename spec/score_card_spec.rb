require 'score_card'

describe ScoreCard do
  let(:scorecard) { described_class.new }

  describe '#frame_scores' do
    context 'when less than 10 frames played' do
      it 'returns score for one non-strike/spare frame' do
        frames = [[3, 4]]
        scores = [7]
        expect(scorecard.frame_scores(frames)).to eq(scores)
      end

      it 'returns score for two non-strike/spare frames' do
        frames = [[2, 1], [5, 0]]
        scores = [3, 5]
        expect(scorecard.frame_scores(frames)).to eq(scores)
      end

      it 'returns score when spare achieved' do
        frames = [[5, 5], [2, 4]]
        scores = [12, 6]
        expect(scorecard.frame_scores(frames)).to eq(scores)
      end

      it 'returns score when strike achieved' do
        frames = [[10], [6, 1]]
        scores = [17, 7]
        expect(scorecard.frame_scores(frames)).to eq(scores)
      end
    end
  end
end
