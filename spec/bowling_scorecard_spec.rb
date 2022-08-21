require 'bowling_scorecard'
require 'frame'

describe BowlingScorecard do
  context 'roll method' do
    it 'adds roll to the current Frame' do
      bowling_scorecard = BowlingScorecard.new
      frame = Frame.new
      bowling_scorecard.roll(5, frame)
      expect(frame.rolls).to eq [5]
      bowling_scorecard.roll(4, frame)
      expect(frame.rolls).to eq [5, 4]
    end
  end
end
