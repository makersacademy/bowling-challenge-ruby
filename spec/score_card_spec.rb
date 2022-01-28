require 'score_card'

describe ScoreCard do
  let(:scoreCard) { ScoreCard.new }
  describe '.frame_result' do
    it 'adds a frames scores to the scores array' do
      scoreCard.frame_result([1,2])
      expect(scoreCard.scores).to include [1, 2]
    end
  end


end