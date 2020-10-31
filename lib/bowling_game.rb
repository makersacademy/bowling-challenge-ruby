require_relative 'frame' 

class BowlingGame
  def initialize
    @score = 0
    @rolls = []
    @roll_number = 0
  end

  def bowl(pins, frame = Frame)
    if pins == 10 && @roll_number.even?
      @frame = frame.new
      @frame.add_to_frame(pins)
      @frame.add_to_frame(0)
      @rolls << @frame
      @roll_number += 2
    elsif @roll_number.even?
      @frame = frame.new
      @frame.add_to_frame(pins)
      @roll_number += 1
    else
      @frame.add_to_frame(pins)
      @rolls << @frame
      @roll_number += 1
    end
  end

  def score
    @rolls.each_with_index do |frame, index|
      if frame.strike?
        @score += frame.total + @rolls[index + 1].total
      elsif frame.spare?
        @score += frame.total + @rolls[index + 1].first_roll
      else
        @score += frame.total
      end
    end
    @score
  end
end
