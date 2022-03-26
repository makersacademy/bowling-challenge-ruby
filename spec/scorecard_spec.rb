require 'scorecard'
require 'frame'

describe ScoreCard do

  subject(:card) { described_class.new }
  let(:frame) { Frame.new }

  describe '#frame_score' do
    it 'returns the total score of 5 for a frame' do
      card.frame.add_first_roll(2)
      card.frame.add_second_roll(3)
      expect(card.frame_score).to eq 5
    end

    it 'returns "pending" in case of strike' do
      card.frame.add_first_roll(10)
      expect(card.frame_score).to eq 'pending'
    end

    it 'returns "pending" in case of  spare' do
      card.frame.add_first_roll(3)
      card.frame.add_second_roll(7)
      expect(card.frame_score).to eq 'pending'
    end
  end
end
