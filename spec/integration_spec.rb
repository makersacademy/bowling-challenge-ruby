require 'game'
require 'frame'

RSpec.describe 'Scorecard behaviour' do
  context "given 10 frames are completed" do
    it "adds the frame points to the scorecard and returns points" do
      scorecard = Scorecard.new
      10.times do
        frame = Frame.new(5, 3)
        scorecard.add_frame(frame)
      end
      expect(scorecard.calculate_score).to eq(80)
    end
  end

  context "given 10 frames are completed" do
    it "maps the frames scores to an array of arrays" do
      scorecard = Scorecard.new
      10.times do
        frame = Frame.new(5, 3)
        scorecard.add_frame(frame)
        end
        expect(scorecard.frame_scores).to eq([[5, 3], [5, 3], [5, 3], [5, 3], [5, 3], [5, 3], [5, 3], [5, 3], [5, 3], [5, 3]])
      end
    end
  end

  context "given a full 10 frame game with a strike on the first frame" do
    xit "adds the frame points to the scorecard and returns points" do
      scorecard = Scorecard.new
      frame = Frame.new(10, 0) # strike on the first frame
      scorecard.add_frame(frame)
      9.times do
        frame = Frame.new(5, 3) # non-strike frame
        scorecard.add_frame(frame)
      end
      expect(scorecard.calculate_score).to eq(78) # score would be 78, since the last frame doesn't get an additional bonus roll due to not being a spare or strike
    end
  end

  context "given frames are added TESTER P TEST" do
    it "prints the frame" do
      scorecard = Scorecard.new
      10.times do
        frame = Frame.new(5, 3)
        scorecard.add_frame(frame)
      end
      expect(scorecard.calculate_score).to eq("NA")
    end
  end

#   context "given a strike occurs on roll_one" do
#     it "skips second roll and returns a total score in current frame as 10" do
#       scorecard = Scorecard.new
#       frame_one = Frame.new
#       frame_one.roll_points(10, 4)
#       scorecard.add_frame_points_to_total_score(frame_one)
#       expect(scorecard.score_so_far).to eq(10)
#     end
#   end

#   context "given a full game with a strike on first roll" do
#     it "returns the correct amount of points" do
#       scorecard = Scorecard.new
#       frame_one = Frame.new
#       frame_one.roll_points(10, 4)
#       scorecard.add_frame_points_to_total_score(frame_one)

#       frame_two = Frame.new
#       frame_two.roll_points(4, 4)
#       scorecard.add_frame_points_to_total_score(frame_two)

#       frame = Frame.new
#       8.times do
#         frame.roll_points(3, 3)
#       end
#       scorecard.add_frame_points_to_total_score(frame)
#       expect(scorecard.score_so_far).to eq(98)
#     end
#   end

#   context "given a strike occurs on roll_one" do
#     xit "adds the points from the next frame roll_one and roll_two to total" do
#       scorecard = Scorecard.new
#       frame_one = Frame.new
#       frame_one.roll_points(10, 4)
#       scorecard.add_frame_points_to_total_score(frame_one)
#       expect(scorecard.score_so_far).to eq(10)
#       frame_two = Frame.new
#       frame_two.roll_points(4, 3)
#       scorecard.add_frame_points_to_total_score(frame_two)
#       expect(scorecard.score_so_far).to eq(24)
#     end
#   end
# end