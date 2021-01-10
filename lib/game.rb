# frozen_string_literal: true

class Game
  attr_accessor :frame_score, :results, :frame_count

  def initialize
    @frame_score = []
    @results = []
    @frame_count = 0
  end

  def input_scores(*args)
    raise ArgumentError, 'Too many arguments (there should be a maximum of two).' if args.length > 2
    raise ArgumentError, 'Argument total is too high (the maximum total should be ten).' if args.sum > 10
    raise RuntimeError, 'You have played 10 frames and your game is now over.' if @frame_count >= 10

    @results << args
    @frame_count = @results.length
    if args == [10]
      "You scored a Strike for frame #{@frame_count}. Nice work!"
    elsif args.length == 2 && args.sum == 10
      "You scored a Spare for frame #{@frame_count}. Not bad!"
    else
      "Your bowls for frame #{@frame_count} are #{args[0]} and #{args[1]}."
    end
  end

  def print_frame_score
    "Your current score this frame is #{@frame_score.sum}."
  end

  def current_frame
    "You are currently on frame #{@frame_count} of 10. You have #{10 - @frame_count} frames to play."
  end

  def bonus_points
    if @results[@frame_count - 2] == [10]
      @results[@frame_count - 2] << @results[@frame_count - 1].sum
    elsif @results[@frame_count - 2] != [10] && @results[@frame_count - 2].sum == 10
      @results[@frame_count - 2] << @results[@frame_count - 1][0]
    else
      p 'You are not due any bonus points for the last frame.'
    end
  end

end
