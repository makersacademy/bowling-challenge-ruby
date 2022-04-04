# frozen_string_literal: true

require_relative 'frame'

# A class to store frames and calculate the score of those frames
class Scorecard
  attr_reader :turn, :frames

  def initialize(turn = 1)
    @turn = turn
    @frames = [Frame.new(@turn)]
  end

  def roll(number_of_pins)
    raise 'Your game is complete' if @turn == 10 && @frames.last.complete?

    if @frames.last.complete? && @turn < 10
      @turn += 1
      @frames << Frame.new(@turn)
    end
    @frames.last.roll(number_of_pins)
  end

  def score
    @score = 0
    @frames.each_with_index do |frame, index|
      if @frames.last == frame
        add_frame_score(frame.score)
      elsif frame.strike?
        frame.score += if @frames[index + 1].strike? && @frames.last != @frames[index + 1]
                         @frames[index + 1].total + @frames[index + 2].roll1
                       elsif @frames[index + 1].strike? && @frames.last == @frames[index + 1]
                         (@frames[index + 1].roll1 + @frames[index + 1].roll2)
                       else
                         @frames[index + 1].total
                       end
        add_frame_score(frame.score)
      elsif frame.spare?
        frame.score += @frames[index + 1].roll1
        add_frame_score(frame.score)
      else
        @score += frame.total
      end
    end
    @frames.each { |frame| frame.score = frame.calculate_total }
    @score
  end

  def add_frame_score(frame_score)
    @score += frame_score
  end
end
