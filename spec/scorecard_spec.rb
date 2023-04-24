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

  describe 'strike bonus' do
    it 'calculates the strike bonus correctly' do
      game = Game.new

      # Roll a strike
      game.roll(10)

      # Roll two more rolls
      game.roll(3)
      game.roll(4)

      expected_scorecard = "FRAME 1: ROLL 1: 10 | TOTAL: 17 | SCORE: 17\n" \
                           "FRAME 2: ROLL 1: 3 ROLL 2: 4 | TOTAL: 7 | SCORE: 24\n"

      expect(game.scorecard.to_s).to eq(expected_scorecard)
    end
  end
end