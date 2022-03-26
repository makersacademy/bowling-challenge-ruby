require 'scorecard'

describe ScoreCard do

  subject(:card) { described_class.new }

  describe '#frame_score' do
    it 'returns the total score for a frame' do
      expect(card.frame_score).to eq 5
    end
  end
end
