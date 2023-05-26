# frozen_string_literal: true

require 'frame_spec'
require 'scorecard'

RSpec.describe 'ScoreCard and Frame Integration' do
  context 'Inputting Frames to a ScoreCard' do
    it 'correctly inputs one Frame object into the total array' do
      scorecard = ScoreCard.new
      frame_one = Frame.new
      frame_one.result(3, 5)

      expect(scorecard.frame_input(frame_one)).to eq "Current Total: 8 - 9 frames left\n[[3, 5]]"
    end

    it 'correctly inputs two Frame object into the total array' do
      scorecard = ScoreCard.new
      frame_one = Frame.new
      frame_one.result(3, 5)
      scorecard.frame_input(frame_one)
      frame_two = Frame.new
      frame_two.result(7, 1)
      expect(scorecard.frame_input(frame_two)).to eq "Current Total: 16 - 8 frames left\n[[3, 5], [7, 1]]"
    end

    it 'correctly identifies a Frame Object that is a Strike' do
      scorecard = ScoreCard.new
      frame_one = Frame.new
      frame_one.result(10, 0)
      scorecard.frame_input(frame_one)
      frame_two = Frame.new
      frame_two.result(3, 2)
      expect(scorecard.frame_input(frame_two)).to eq "Current Total: 20 - 8 frames left\n[[15, 0], [3, 2]]"
    end

    it 'correctly identifies a Frame Object that is a Spare' do
      scorecard = ScoreCard.new
      frame_one = Frame.new
      frame_one.result(8, 2)
      scorecard.frame_input(frame_one)
      frame_two = Frame.new
      frame_two.result(3, 2)
      expect(scorecard.frame_input(frame_two)).to eq "Current Total: 18 - 8 frames left\n[[13, 0], [3, 2]]"
    end
  end

  context 'correctly returns a total score of frames so far' do
    it 'correctly returns the result of two frames' do
      scorecard = ScoreCard.new
      frame_one = Frame.new
      frame_one.result(3, 5)
      scorecard.frame_input(frame_one)
      frame_two = Frame.new
      frame_two.result(7, 1)
      scorecard.frame_input(frame_two)

      expect(scorecard.calculate_total).to eq "Current Total: 16 - 8 frames left\n[[3, 5], [7, 1]]"
    end

    it 'correctly returns the result of six frames, with Spares and Strikes' do
      scorecard = ScoreCard.new
      frame_one = Frame.new
      frame_one.result(3, 5)
      scorecard.frame_input(frame_one)
      frame_two = Frame.new
      frame_two.result(7, 1)
      scorecard.frame_input(frame_two)
      frame_three = Frame.new
      frame_three.result(10, 0)
      scorecard.frame_input(frame_three)
      frame_four = Frame.new
      frame_four.result(4, 3)
      scorecard.frame_input(frame_four)
      frame_five = Frame.new
      frame_five.result(2, 8)
      scorecard.frame_input(frame_five)
      frame_six = Frame.new
      frame_six.result(3, 5)
      scorecard.frame_input(frame_six)

      expect(scorecard.calculate_total).to eq "Current Total: 61 - 4 frames left\n[[3, 5], [7, 1], [17, 0], [4, 3], [13, 0], [3, 5]]"
    end

    it 'should return the tenth frame method' do
      scorecard = ScoreCard.new
      frame_one = Frame.new
      frame_one.result(3, 5)
      scorecard.frame_input(frame_one)
      frame_two = Frame.new
      frame_two.result(7, 1)
      scorecard.frame_input(frame_two)
      frame_three = Frame.new
      frame_three.result(10, 0)
      scorecard.frame_input(frame_three)
      frame_four = Frame.new
      frame_four.result(4, 3)
      scorecard.frame_input(frame_four)
      frame_five = Frame.new
      frame_five.result(2, 8)
      scorecard.frame_input(frame_five)
      frame_six = Frame.new
      frame_six.result(3, 5)
      scorecard.frame_input(frame_six)
      frame_seven = Frame.new
      frame_seven.result(10, 0)
      scorecard.frame_input(frame_seven)
      frame_eight = Frame.new
      frame_eight.result(4, 3)
      scorecard.frame_input(frame_eight)
      frame_nine = Frame.new
      frame_nine.result(2, 8)
      scorecard.frame_input(frame_nine)
      frame_ten = Frame.new
      frame_ten.result(3, 5)

      expect(scorecard.frame_input(frame_ten)).to eq "Final Total: 106 - Frames:\n[[3, 5], [7, 1], [17, 0], [4, 3], [13, 0], [3, 5], [17, 0], [4, 3], [13, 0], [3, 5]]"
    end
  end
end
