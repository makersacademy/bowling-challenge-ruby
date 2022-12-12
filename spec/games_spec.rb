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

  describe "#calculate_current_score" do
    context "calculates the player's score when" do
      it "one frame  played with no strikes or spares" do
        game = Game.new
        game.add_frame(1,1)
        expect(game.calculate_current_score).to eq 2
      end
  
      it "two frames played with no strikes or spares" do
        game = Game.new
        game.add_frame(1,1)
        game.add_frame(1,1)
        expect(game.calculate_current_score).to eq 4
      end
  
      it "two frames  added with the first being a spare" do
        game = Game.new
        game.add_frame(9,1)
        game.add_frame(1,1)
        expect(game.calculate_current_score).to eq 13
      end
  
      it "two frames added with the first being a strike" do
        game = Game.new
        game.add_frame(10,0)
        game.add_frame(1,1)
        expect(game.calculate_current_score).to eq 14
      end
  
      it "three frames added with the first and second frames being strikes" do
        game = Game.new
        game.add_frame(10,0)
        game.add_frame(10,0)
        game.add_frame(1,1)
        expect(game.calculate_current_score).to eq 35
      end
  
      it "three frames with first frame being strike and second being spare" do
        game = Game.new
        game.add_frame(10,0)
        game.add_frame(9,1)
        game.add_frame(1,1)
        expect(game.calculate_current_score).to eq 33
      end
    end
  end
end







