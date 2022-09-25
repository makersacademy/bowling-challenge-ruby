require 'frame'
require 'game'

RSpec.describe "integration" do
  context "sum" do
    it "returns a 0 if no pins were hit" do
      frame1 = Frame.new
      frame1.roll_1 = 0
      frame1.roll_2 = 0
      frame2 = Frame.new
      frame2.roll_1 = 0
      frame2.roll_2 = 0
      game = Game.new
      game.add_frame(frame1)
      game.add_frame(frame2)
      expect(game.sum).to eq 0
    end

    it "sums up all the points if there are no strikes or spares" do
      frame1 = Frame.new
      frame1.roll_1 = 2
      frame1.roll_2 = 3
      frame2 = Frame.new
      frame2.roll_1 = 3
      frame2.roll_2 = 4
      game = Game.new
      game.add_frame(frame1)
      game.add_frame(frame2)
      expect(game.sum).to eq 12
    end

    it "takes spares into account by adding the next roll to the total sum 1" do
      frame1 = Frame.new
      frame1.roll_1 = 2
      frame1.roll_2 = 7
      frame2 = Frame.new
      frame2.roll_1 = 3
      frame2.roll_2 = 7
      frame3 = Frame.new
      frame3.roll_1 = 2
      frame3.roll_2 = 1
      game = Game.new
      game.add_frame(frame1)
      game.add_frame(frame2)
      game.add_frame(frame3)
      expect(game.sum).to eq 24
    end

    it "takes spares into account by adding the next roll to the total sum 2" do
      frame1 = Frame.new
      frame1.roll_1 = 3
      frame1.roll_2 = 7
      frame2 = Frame.new
      frame2.roll_1 = 2
      frame2.roll_2 = 7

      game = Game.new
      game.add_frame(frame1)
      game.add_frame(frame2)
      expect(game.sum).to eq 21
    end

    it "takes strikes into account by adding the next 2 rolls to the total sum" do
      frame1 = Frame.new
      frame1.roll_1 = 10
      frame2 = Frame.new
      frame2.roll_1 = 2
      frame2.roll_2 = 7
      frame3 = Frame.new
      frame3.roll_1 = 3
      frame3.roll_2 = 4

      game = Game.new
      game.add_frame(frame1)
      game.add_frame(frame2)
      game.add_frame(frame3)
      expect(game.sum).to eq 35
    end

    it "returns 300 if there were 12 strikes" do
      frame1 = Frame.new
      frame1.roll_1 = 10
      frame2 = Frame.new
      frame2.roll_1 = 10
      frame3 = Frame.new
      frame3.roll_1 = 10
      frame4 = Frame.new
      frame4.roll_1 = 10
      frame5 = Frame.new
      frame5.roll_1 = 10
      frame6 = Frame.new
      frame6.roll_1 = 10
      frame7 = Frame.new
      frame7.roll_1 = 10
      frame8 = Frame.new
      frame8.roll_1 = 10
      frame9 = Frame.new
      frame9.roll_1 = 10
      frame10 = Frame.new
      frame10.roll_1 = 10
      frame11 = Frame.new
      frame11.roll_1 = 10
      frame12 = Frame.new
      frame12.roll_1 = 10

      game = Game.new
      game.add_frame(frame1)
      game.add_frame(frame2)
      game.add_frame(frame3)
      game.add_frame(frame4)
      game.add_frame(frame5)
      game.add_frame(frame6)
      game.add_frame(frame7)
      game.add_frame(frame8)
      game.add_frame(frame9)
      game.add_frame(frame10)
      game.add_frame(frame11)
      game.add_frame(frame12)

      expect(game.sum).to eq 300
    end


  end
end



# it "returns 300 if there were 12 strikes" do
# end


# it "takes spares into account by adding the next roll to the total sum" do
# end
  