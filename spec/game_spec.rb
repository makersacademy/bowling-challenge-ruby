require 'game'

RSpec.describe do
  context "add_frame" do
    it "adds the frames to the list of all frames" do
      frame1 = double :frame
      frame2 = double :frame
      game = Game.new
      game.add_frame(frame1)
      game.add_frame(frame2)
      expect(game.all_frames).to eq [frame1, frame2]
    end
  end

  context "sum" do
    it "returns a 0 if no pins were hit" do
      frame1 = double :frame, roll_1: 0, roll_2: 0, spare?: false, strike?: false, total: 0
      frame2 = double :frame, roll_1: 0, roll_2: 0, spare?: false, strike?: false, total: 0
      game = Game.new
      game.add_frame(frame1)
      game.add_frame(frame2)
      expect(game.sum).to eq 0
    end

    it "sums up all the points if there are no strikes or spares" do
      frame1 = double :frame, roll_1: 2, roll_2: 7, spare?: false, strike?: false, total: 9
      frame2 = double :frame, roll_1: 3, roll_2: 3, spare?: false, strike?: false, total: 6
      game = Game.new
      game.add_frame(frame1)
      game.add_frame(frame2)
      expect(game.sum).to eq 15
    end

    it "takes spares into account by adding the next roll to the total sum 1" do
      frame1 = double :frame, roll_1: 2, roll_2: 7, spare?: false, strike?: false, total: 9
      frame2 = double :frame, roll_1: 3, roll_2: 7, spare?: true, strike?: false, total: 10
      frame3 = double :frame, roll_1: 2, roll_2: 1, spare?: false, strike?: false, total: 3
      game = Game.new
      game.add_frame(frame1)
      game.add_frame(frame2)
      game.add_frame(frame3)
      expect(game.sum).to eq 24
    end

    it "takes spares into account by adding the next roll to the total sum 2" do
      frame1 = double :frame, roll_1: 3, roll_2: 7, spare?: true, strike?: false, total: 10
      frame2 = double :frame, roll_1: 2, roll_2: 7, spare?: false, strike?: false, total: 9
      game = Game.new
      game.add_frame(frame1)
      game.add_frame(frame2)
      expect(game.sum).to eq 21
    end

    it "takes strikes into account by adding the next 2 rolls to the total sum" do
      frame1 = double :frame, roll_1: 10, roll_2: 0, spare?: false, strike?: true, total: 10
      frame2 = double :frame, roll_1: 2, roll_2: 7, spare?: false, strike?: false, total: 9
      game = Game.new
      game.add_frame(frame1)
      game.add_frame(frame2)
      expect(game.sum).to eq 28
    end

    it "returns 300 if there were 12 strikes" do

    end
  end
end
  