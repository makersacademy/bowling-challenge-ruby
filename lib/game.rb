class Game
  def initialize
    @score = 0
    @roll_number = 0
    @rolls = []
  end

  def regular_strike(pins)
    @roll_number.even? && pins == 10 && @roll_number < 10
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

  def complete_frame(pins)
    @frame.add_to_frame(pins)
    @frame.add_to_frame(0)
    @rolls << @frame
  end

  def score
    @rolls.each_with_index do |frame, index|
      @score += if frame.strike?
                  frame.total + @rolls[index + 1].total
                elsif frame.spare?
                  frame.total + @rolls[index + 1].first_roll
                else
                  frame.total
                end
    end
    @score
  end
end
