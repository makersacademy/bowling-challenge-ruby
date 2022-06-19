require 'bowling'

describe Bowling do 

  context "Bowler is currently playing frame 1" do 
    subject(:game) { Bowling.new }
    let(:frame) { '1' }
    let(:roll) { '1' }
    let(:pins) { '5' }

    it "it returns the frame and the roll the bowler has just played and their current score" do 
      game.frames(frame)
      game.rolls(roll, pins)
      game.frame_score
      game.report
      expect(game.report).to eq "You just played frame: 1 and roll: 1. You currently have 5 points"
    end 
  end 
end 