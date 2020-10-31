require 'game'

describe Game do

  let(:game) { described_class.new }

 describe "#record_roll" do
   it "adds the score of a single roll to the current frame" do
     game.record_roll(5)
     expect(game.current_frame.sum).to eq(5)
   end
 end

 describe "#running_score" do
   it "calculates and returns the current score" do
     game.record_roll(7)
     game.record_roll(2)
     expect(game.running_score).to eq(9)
   end

  describe "#check_current_frame"
   it "empties @current_frame into @completed_frames if it is full" do
     game.record_roll(7)
     game.record_roll(2)
     expect(game.check_current_frame).to eq([])
     expect(game.completed_frames).to eq([[7,2]])
   end
 end
end
