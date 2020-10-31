require '../lib/game'

describe Game do

  let(:game) { described_class.new }
  let(:frame) { double :frame}
  let(:spare) { double 'spare', strike?: false, spare?: true, raw_score: 10, contents: [2,8], rolls: 2 }
  let(:strike) { double 'strike', strike?:true, spare?: false, raw_score: 10, contents: [10], rolls: 1 }
  let(:high_roll) { double 'high_roll', strike?: false, spare?: false, raw_score: 8, contents: [5,3], rolls: 2 }
  let(:low_roll) { double 'low_roll', strike?: false, spare?: false, raw_score: 3, contents: [2,1], rolls: 2 }
  let(:gutter) { double 'gutter', strike?: false, spare?: false, raw_score: 0, contents: [0,0], rolls: 2 }

 describe "#record_roll" do
   it "passes the score of a single roll to the current frame" do
     allow(Frame).to receive(:new).and_return(frame)
     expect(frame).to receive(:record_roll)
     expect(frame).to receive(:rolls)
     expect(frame).to receive(:strike?)
     expect(frame).to receive(:contents)
     game.record_roll(5)
   end
 end

 describe "#raw_running_score" do
   it "retrieves the current score from the current frame" do
     allow(Frame).to receive(:new).and_return(frame)
     expect(frame).to receive(:raw_score).and_return(9)
     expect(game.raw_running_score).to eq(9)
   end
   it "adds the current frame to the score of the previous frames" do
     allow(Frame).to receive(:new).and_return(frame)
     allow(frame).to receive(:record_roll)
     allow(frame).to receive(:raw_score).and_return(9)
     allow(frame).to receive(:rolls).and_return(2)
     allow(frame).to receive(:strike?).and_return(false)
     allow(frame).to receive(:contents).and_return([2,7])
     game.record_roll(9)

     expect(game.raw_running_score).to eq(18)
   end
 end

 describe "#completed_frames_with_bonuses" do
   it "correctly applies bonus after a spare" do
     expect(game.completed_frames_with_bonuses( [spare, high_roll] )).to eq(23)
   end
   it "correctly applies bonus after a strike" do
     expect(game.completed_frames_with_bonuses([strike, high_roll, low_roll] )).to eq(29)
   end
   it "correctly applies bonus after multiple strikes" do
     expect(game.completed_frames_with_bonuses( [strike, strike, strike] )).to eq(30)
   end

 end

  describe "#check_current_frame" do
   it "empties @current_frame into @completed_frames if it contains two rolls" do
     allow(Frame).to receive(:new).and_return(frame)
     allow(frame).to receive(:rolls).and_return(2)
     allow(frame).to receive(:contents)
     game.check_current_frame
     expect(game.completed_frames).to eq([frame])
   end
   it "empties @current_frame into @completed_frames if it contains a strike" do
    allow(game).to receive(:current_frame).and_return(frame)
    allow(frame).to receive(:strike?).and_return(true)

    expect(game.check_current_frame).to eq([])
   end
 end
end
