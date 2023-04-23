require 'bowling2'
require 'frame'

RSpec.describe 'Scorecard behaviour' do
  context "given a single frame is completed" do
    it "adds the frame points to the scorecard and returns points" do
      scorecard = Scorecard.new
      frame_one = Frame.new
      frame_one.roll_one(2)
      frame_one.roll_two(4)
      scorecard.add_frame_points_to_total_score(frame_one)
      expect(scorecard.score_so_far).to eq(6)
    end
  end
end