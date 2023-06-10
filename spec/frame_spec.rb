require 'frame'

RSpec.describe Frame do
  context ".add_ball_score" do
    it "adds a ball score to the frame" do
      frame = Frame.new(1)
      frame.add_ball_score(1, 5)
      expect(frame.get_ball_score(1)).to eq 5
    end
  end
end