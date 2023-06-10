require 'frame'

RSpec.describe Frame do
  context ".add_ball_score" do
    it "adds a ball score to the frame" do
      frame = Frame.new(1)
      frame.add_ball_score(1, 5)
      expect(frame.get_ball_score(1)).to eq 5
    end
  end

  context ".get_ball_score" do
    it "returns the score for a given ball in the frame" do
      frame = Frame.new(1)
      frame.add_ball_score(2, 3)
      expect(frame.get_ball_score(2)).to eq 3
    end
  end

  context ".score" do
    it "returns the score for the frame" do
      frame = Frame.new(1)
      frame.add_ball_score(1, 4)
      frame.add_ball_score(2, 3)
      expect(frame.score).to eq 7
    end
  end
end