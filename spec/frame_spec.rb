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

  context ".update_bonus_score" do
    it "updates the bonus score for the frame" do
      frame = Frame.new(1)
      frame.update_bonus_score(5)
      expect(frame.bonus_score).to eq 5
    end
  end

  context ".strike?" do
    it "returns true if the frame has a strike" do
      frame = Frame.new(1)
      frame.add_ball_score(1, 'X')
      expect(frame.strike?).to eq true
    end
  end

  context ".two_bowls?" do
    it "returns true if the frame has two two_bowls" do
      frame = Frame.new(1)
      frame.add_ball_score(1, 2)
      frame.add_ball_score(2, 3)
      expect(frame.two_bowls?).to eq true
    end
  end

  context ".spare?" do
    it "returns true if the frame has a spare" do
      frame = Frame.new(1)
      frame.add_ball_score(1, '3')
      frame.add_ball_score(2, '/')
      expect(frame.spare?).to eq true
    end
  end
end