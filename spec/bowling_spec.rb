require 'bowling'

describe Bowling do 
  subject(:game) { Bowling.new }

  context "Bowler is currently playing frame 1" do 
    let(:frame) { '1' }
    let(:roll) { '1' }
    let(:pins) { '5' }

    it "it returns the frame and the roll the bowler has just played and their current score" do 
      game.frames(frame)
      game.rolls(roll, pins)
      game.frame_score
      game.report
      expect(game.report).to include "You just played frame: 1 and roll: 1. You currently have 5 points."
    end 
  end 

  context "Bowler has finished playing frame 1 with no spares or strikes" do 
    let(:frame) {'1'}
    let(:roll_1) {'1'}
    let(:pins_1) {'7'}
    let(:roll_2) {'2'}
    let(:pins_2) {'2'}

    it "it returns the frame, the roll the bowler has just played and their current total score" do 
      game.frames(frame)
      game.rolls(roll_1, pins_1)
      game.rolls(roll_2, pins_2)
      game.frame_score
      game.report
      expect(game.report).to eq "You just played frame: 1 and roll: 2. You currently have 9 points."
    end 
  end 


end 