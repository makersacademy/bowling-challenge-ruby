require 'scorecard'
require 'frame'

describe ScoreCard do

  subject(:card) { described_class.new }

  describe '#frame_score' do
    it 'returns the total score of 5 for a frame' do
      frame = Frame.new
      card.frame.add_first_roll(2)
      card.frame.add_second_roll(3)
      expect(card.frame_score).to eq 5
    end
  end
end
