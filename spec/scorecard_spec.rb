require 'scorecard'
require 'frame'
require 'roll'

RSpec.describe Scorecard do
  describe '#update' do
    it 'updates the scorecard with the score for a frame' do
      scorecard = Scorecard.new
      frame = Frame.new
      rolls = [Roll.new(3), Roll.new(5)]
      frame.instance_variable_set(:@rolls, rolls)
      frames = [frame]
      scorecard.update(frame, frames)

      # puts statement is to see what the scorecard looks like as I build it
      puts scorecard.to_s

      expected_scorecard = "FRAME 1: ROLL 1: 3 ROLL 2: 5 | TOTAL: 8 | SCORE: 8\n"

      expect(scorecard.to_s).to eq(expected_scorecard)
    end
  end
end