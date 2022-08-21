require 'scorecard'

RSpec.describe Scorecard do
  context 'player plays a gutter game' do
    it 'returns 0 points' do
      scorecard = Scorecard.new
      frame = Frame.new(0, 0)
      scorecard.add(frame)
      scorecard.add(frame)
      scorecard.add(frame)
      scorecard.add(frame)
      scorecard.add(frame)
      scorecard.add(frame)
      scorecard.add(frame)
      scorecard.add(frame)
      scorecard.add(frame)
      scorecard.add(frame)

      expect(scorecard.calculate_score).to eq 0
    end
  end
end