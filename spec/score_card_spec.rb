require 'score_card'

describe ScoreCard do
  let(:scorecard) { described_class.new }

  describe '#frame_scores' do
    context 'when one frame played' do
      it 'returns score for one non-strike/spare frame' do
        frames = [[3, 4]]
        scores = [7]
        expect(scorecard.frame_scores(frames)).to eq(scores)
      end
    end
  end
end
