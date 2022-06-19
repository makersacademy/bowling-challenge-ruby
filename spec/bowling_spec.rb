require 'bowling'

describe Bowling do 
  subject(:game) { Bowling.new }

  context "The bowler is currently playing frame 1" do 
    let(:frame) { '1' }
    let(:roll) { '1' }
    let(:pins) { '5' }

    it "it returns the frame and the roll the bowler has just played" do 
      game.frames(frame)
      game.rolls(roll, pins)
      game.report
      expect(game.report).to include "You just played frame: 1 and roll: 1."
    end 
  end 

  context "The bowler has played frame 1 with no spares or strikes" do 
    let(:frame) { '1' }
    let(:roll_1) { '1' }
    let(:pins_1) { '7' }
    let(:roll_2) { '2' }
    let(:pins_2) { '2' }

    it "it returns the bowler's current score, the frame and the roll the bowler just played" do 
      game.frames(frame)
      game.rolls(roll_1, pins_1)
      game.rolls(roll_2, pins_2)
      game.frame_score
      game.total_score
      game.report
      expect(game.total_score).to eq "Your current score is 9 points"
    end
  end 

  context "The bowler has played frame 1 and scored a spare" do 
    let(:frame_1) { '1' }
    let(:roll_1) { '1' }
    let(:pins_1) { '8' } 
    let(:roll_2) { '2' }
    let(:pins_2) { '2' }

    it "it returns a well done message and the bowler's current score" do 
      game.frames(frame_1)
      game.rolls(roll_1, pins_1)
      game.rolls(roll_2, pins_2)
      game.spare
      game.frame_score
      game.total_score
      expect(game.spare).to eq "Well Done! You scored a spare!"
      expect(game.total_score).to eq "Your current score is 18 points" # (10+8)
    end 
  end 

  context "The bowler has played frame 2 with no spares or strikes" do 
    let(:frame_1) { '1' }
    let(:roll_f1_1) { '1' }
    let(:pins_f1_1) { '4' }
    let(:roll_f1_2) { '2' }
    let(:pins_f1_2) { '2' }
    
    let(:frame_2) { '2' }
    let(:roll_f2_1) { '1' }
    let(:pins_f2_1) { '5' }
    let(:roll_f2_2) { '2' }
    let(:pins_f2_2) { '4' }

    it "it returns the bowler's current score, the frame and the roll the bowler just played" do
      game.frames(frame_1)
      game.rolls(roll_f1_1, pins_f1_1)
      game.rolls(roll_f1_2, pins_f1_2)
      game.frame_score

      game.frames(frame_2)
      game.rolls(roll_f2_1, pins_f2_1)
      game.rolls(roll_f2_2, pins_f2_2)
      game.frame_score
      
      game.total_score
      expect(game.total_score).to eq "Your current score is 15 points"
    end 
  end 
end 
