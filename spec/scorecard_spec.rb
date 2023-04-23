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

      # \t is a tab character and \n is a newline character
      expected_scorecard = "FRAME\t\t\t\t1\n"
      expected_scorecard += "  ROLL 1\t3\n"
      expected_scorecard += "  ROLL 2\t5\n"
      expected_scorecard += "  TOTAL\t8\n"
      expected_scorecard += "  SCORE\t8\n"

      expect(scorecard.to_s).to eq(expected_scorecard)
    end
  end
end
