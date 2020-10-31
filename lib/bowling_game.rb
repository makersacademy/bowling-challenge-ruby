require_relative 'frame'

class BowlingGame
  def initialize
    @score = 0
    @rolls = []
    @roll_number = 0
  end

  def regular_strike(pins)
    ## If the first roll was a strike and pre-final-frame
    @roll_number.even? && pins == 10 && @roll_number < 18
  end
  def complete_frame(pins)
      @frame.add_to_frame(pins)
      @frame.add_to_frame(0)
      @rolls << @frame
  end

  def first_roll?
   @roll_number.even?
  end

  def bowl(pins, frame = Frame)
    if regular_strike(pins)
      @frame = frame.new
      complete_frame(pins)
      @roll_number += 2
    elsif @roll_number == 20
      @rolls.last.add_bonus(pins)
    elsif first_roll?
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
      else # spare bonuses now calculated below as they no longer equal 10 (bonus score has been added to frame)
        @score += frame.total
      end
    end
    @score
  end
end
