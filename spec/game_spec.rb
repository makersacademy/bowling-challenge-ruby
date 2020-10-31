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
   it "calculates and returns the current score (single frame)" do
     game.record_roll(7)
     game.record_roll(2)
     expect(game.running_score).to eq(9)
   end
   it "calculates and returns the current score (multiple frames)" do
     game.record_roll(7)
     game.record_roll(2)
     game.record_roll(6)
     game.record_roll(1)
     expect(game.running_score).to eq(16)
   end
   it "calculates and returns the current score (including a spare)" do
     game.record_roll(7)
     game.record_roll(3)
     game.record_roll(6)
     game.record_roll(1)
     expect(game.running_score).to eq(23)
   end

 end

  describe "#check_current_frame" do
   it "empties @current_frame into @completed_frames if it contains two rolls" do
     game.record_roll(7)
     game.record_roll(2)
     expect(game.check_current_frame).to eq([])
     expect(game.completed_frames).to eq([[7,2]])
   end
   it "empties @current_frame into @completed_frames if it contains a strike" do
     game.record_roll(10)
     expect(game.check_current_frame).to eq([])
   end
 end
end
