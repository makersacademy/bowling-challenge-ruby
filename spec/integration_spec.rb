require "frame"
require "rspec"
require "scorecard"


describe Frame do
    describe "#score" do
      it "returns the sum of two rolls in a single frame" do
       frame = Frame.new(1, 4)
       expect(frame.score).to eq(5)
      end
    end

    describe "#spare?" do
      it "returns true if the frame is a spare(5,5)" do
       frame = Frame.new(5, 5)
       expect(frame.spare?).to be true
      end
    

      it "returns false if the frame is not a spare" do
        frame = Frame.new(1, 7)
        expect(frame.spare?).to be false
      end
    end

    describe "#strike?" do
      it "returns true if the frame is a strike(10,0)" do
       frame = Frame.new(10, 0)
       expect(frame.strike?).to be true
     end


      it "returns false if the frame is not a strike" do
       frame = Frame.new(1, 4)
       expect(frame.strike?).to be false
      end
    end
end

describe ScoreCard do

    it "calculates the correct score for a game with no strikes or spares" do
        scorecard = ScoreCard.new
        10.times do
          scorecard.add_frame(Frame.new(3, 2))
        end
        expect(scorecard.score).to eq(50)
    end

   
    xit "calculates the correct score for a game with strikes" do
        scorecard = ScoreCard.new
        scorecard.add_frame(Frame.new(10, 0))
        scorecard.add_frame(Frame.new(5, 0))
        scorecard.add_frame(Frame.new(1, 2))
        8.times do
          scorecard.add_frame(Frame.new(0, 0))
        end
        expect(scorecard.score).to eq(23)
    end


    it "calculates the correct score for a game with no strikes or spares" do
      scorecard = ScoreCard.new
      10.times do
        scorecard.add_frame(Frame.new(1, 2))
      end
      expect(scorecard.score).to eq(30)
    end

    it "calculates the correct score for a gutter game with no pins scored" do
        scorecard = ScoreCard.new
        10.times do
          scorecard.add_frame(Frame.new(0, 0))
        end
        expect(scorecard.score).to eq(0)
    end

    it "calculates score for a perfect game" do
        scorecard = ScoreCard.new
        12.times do
          scorecard.add_frame(Frame.new(10,0))
        end
        expect(scorecard.score).to eq(300)
    end
end 

