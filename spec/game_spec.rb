require 'game'

RSpec.describe Game do
  describe "#add_frame" do
    context "less than ten frames have been added" do
      it "adds a frame to the list of frames" do
          game = Game.new
          game.add_frame(2,3)
          expect(game.frames.length).to eq 1
      end
    end
    context "10 frames have already been added" do
      it "does not add another frame" do
        game = Game.new
        10.times { game.add_frame(1,1) }
        game.add_frame(7,2)
        expect(game.frames.length).to eq 10
      end
    end
  end

  describe "#calculate_current_score" do
    context "calculates the user's score so far when" do
      it "one frame has been played" do
        game = Game.new
        game.add_frame(1,1)
        expect(game.calculate_current_score).to eq 2
      end

      it "two frames have been played" do
        game = Game.new
        game.add_frame(1,1)
        game.add_frame(1,1)
        expect(game.calculate_current_score).to eq 4
      end
    end
  end
end