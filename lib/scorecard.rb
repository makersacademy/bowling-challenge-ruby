require_relative './frame'

class Scorecard
  def initialize
    @frame_one = Frame.new
    @frame_two = Frame.new
    @frame_three = Frame.new
    @frame_four = Frame.new
    @frame_five = Frame.new
    @frame_six = Frame.new
    @frame_seven = Frame.new
    @frame_eight = Frame.new
    @frame_nine = Frame.new
    @frame_ten = Frame.new
    @game_score = 0
  end

  attr_accessor :frame_one,
                :frame_two,
                :frame_three,
                :frame_four,
                :frame_five,
                :frame_six,
                :frame_seven,
                :frame_eight,
                :frame_nine,
                :frame_ten,
                :game_score
end
