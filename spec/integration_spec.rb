require 'bowling'
require 'frame'

RSpec.describe 'Scorecard behaviour' do
  context "given a single frame is completed" do
    it "adds the frame points to the scorecard and returns points" do
      scorecard = Scorecard.new
      frame_one = Frame.new
      frame_one.roll_points(5, 3)

      scorecard.add_frame_points_to_total_score(frame_one)
      expect(scorecard.score_so_far).to eq(8)
    end
  end

  context "given a strike occurs on roll_one" do
    it "adds the points from the next frame roll_one and roll_two to total" do
      scorecard = Scorecard.new
      frame_one = Frame.new
      frame_one.roll_points(10, 4)
      scorecard.add_frame_points_to_total_score(frame_one)
      expect(scorecard.score_so_far).to eq(10)
      frame_two = Frame.new
      frame_two.roll_points(4, 3)
      scorecard.add_frame_points_to_total_score(frame_two)
      expect(scorecard.score_so_far).to eq(24)
    end
  end
end