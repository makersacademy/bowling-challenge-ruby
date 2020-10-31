require '../lib/game'

describe Game do

  let(:game) { described_class.new }
  let(:frame) { double :frame}

 describe "#record_roll" do
   it "passes the score of a single roll to the current frame" do
     game.record_roll(5)
     expect(frame).to receive(:record_roll)
   end
 end

 describe "#running_score" do
   it "retrieves the current score from the current frame" do
     allow(game).to receive(:current_frame).and_return(frame)
     expect(frame).to receive(:raw_score)
     expect(game.running_score).to eq(9)
   end
   it "calculates and returns the current score (multiple frames)" do
     game.record_roll(7)
     game.record_roll(2)
     game.record_roll(6)
     game.record_roll(1)
     expect(game.running_score).to eq(16)
   end
   it "correctly applies bonus after a spare" do
     game.record_roll(7)
     game.record_roll(3)
     game.record_roll(6)
     game.record_roll(1)
     expect(game.running_score).to eq(23)
   end
   it "correctly applies bonus after a strike" do
     game.record_roll(10)
     game.record_roll(3)
     game.record_roll(6)
     game.record_roll(1)
     game.record_roll(0)
     expect(game.running_score).to eq(29)
   end
   it "correctly applies bonus after multiple strikes" do
     game.record_roll(10)
     game.record_roll(10)
     game.record_roll(10)
     expect(game.running_score).to eq(30)
   end

 end

  describe "#check_current_frame" do
   it "empties @current_frame into @completed_frames if it contains two rolls" do
     allow(Frame).to receive(:new).and_return(frame)
     allow(frame).to receive(:rolls).and_return(2)
     allow(frame).to receive(:contents).and_return([])

     expect(game.check_current_frame).to eq([])
     expect(game.completed_frames).to eq([frame])
   end
   it "empties @current_frame into @completed_frames if it contains a strike" do
    allow(game).to receive(:current_frame).and_return(frame)
    allow(frame).to receive(:strike?).and_return(true)

    expect(game.check_current_frame).to eq([])
   end
 end
end
