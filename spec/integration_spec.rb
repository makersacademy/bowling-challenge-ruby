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

  context "given a full 10 frame without strike or spare is completed" do
    it "adds the frame points to the scorecard and returns points" do
      scorecard = Scorecard.new
      frame = Frame.new
      10.times do
        frame.roll_points(5, 3)
      end

      scorecard.add_frame_points_to_total_score(frame)
      expect(scorecard.score_so_far).to eq(80)
    end
  end

  context "given a strike occurs on roll_one" do
    it "skips second roll and returns a total score in current frame as 10" do
      scorecard = Scorecard.new
      frame_one = Frame.new
      frame_one.roll_points(10, 4)
      scorecard.add_frame_points_to_total_score(frame_one)
      expect(scorecard.score_so_far).to eq(10)
    end
  end

  context "given a full game with a strike on first roll" do
    xit "returns the correct amount of points" do
      scorecard = Scorecard.new
      frame_one = Frame.new
      frame_one.roll_points(10, 4)
      scorecard.add_frame_points_to_total_score(frame_one)

      frame_two = Frame.new
      frame_two.roll_points(4, 4)
      scorecard.add_frame_points_to_total_score(frame_two)

      frame = Frame.new
      8.times do
        frame.roll_points(3, 3)
      end
      scorecard.add_frame_points_to_total_score(frame)
      expect(scorecard.score_so_far).to eq(98)
    end
  end

  context "given a strike occurs on roll_one" do
    xit "adds the points from the next frame roll_one and roll_two to total" do
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