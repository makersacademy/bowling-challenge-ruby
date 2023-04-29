require 'game'
require 'frame'

RSpec.describe 'Scorecard behaviour' do
  context "given 10 frames are completed" do
    it "adds the frame points to the scorecard and returns points" do
      scorecard = Scorecard.new
      10.times do
        frame = Frame.new(5, 3, 0)
        scorecard.add_frame(frame)
      end
      expect(scorecard.calculate_score).to eq(80)
    end
  end

  context "given 10 frames are completed" do
    it "maps the frames scores to an array of arrays" do
      scorecard = Scorecard.new
      8.times do
        frame = Frame.new(5, 3, 0)
        scorecard.add_frame(frame)
      end
      frame2 = Frame.new(10, 0, 0)
      scorecard.add_frame(frame2)
      frame3 = Frame.new(10, 10, 10)
      scorecard.add_frame(frame3)
      expect(scorecard.frame_scores).to eq([[5, 3, 0], [5, 3, 0], [5, 3, 0], [5, 3, 0], [5, 3, 0], [5, 3, 0], [5, 3, 0], [5, 3, 0], [10, 0, 0], [10, 10, 10]])
      end
  end

  context "given a full 10 frame game with a strike on the first frame" do
    it "adds the frame points to the scorecard and returns points" do
      scorecard = Scorecard.new
      frame = Frame.new(10, 0, 0) # strike on the first frame
      scorecard.add_frame(frame)
      9.times do
        frame = Frame.new(5, 3, 0) # non-strike frame
        scorecard.add_frame(frame)
      end
      expect(scorecard.calculate_score).to eq(82) # score would be 82, since the last frame doesn't get an additional bonus roll due to not being a spare or strike
    end
  end
end