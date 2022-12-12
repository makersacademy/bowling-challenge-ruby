require 'game'

RSpec.describe Game do
  describe "#add_frame" do
    context "less than 10 frames  added" do
      it "adds a frame to the list of frames" do
          game = Game.new
          game.add_frame(2,3)
          expect(game.frames.length).to eq 1
      end
    end
    context "10 frames already been added" do
      it "doesn't add another frame" do
        game = Game.new
        10.times { game.add_frame(1,1) }
        game.add_frame(7,2)
        expect(game.frames.length).to eq 10
      end
    end
  end
end