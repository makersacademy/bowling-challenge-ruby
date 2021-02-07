# frozen_string_literal: true

# Frame class
class Frame
  STRIKE = 10
  SPARE = 10
  TOTAL_NUMBER_OF_FRAMES = 10

  attr_reader :number
  attr_accessor :roll_one, :roll_two, :bonus_roll, :score

  def initialize(number)
    @number = number
    @roll_one = nil
    @roll_two = nil
    @bonus_roll = nil
    @score = 0
  end

  def calculate_score
    @score = if number < TOTAL_NUMBER_OF_FRAMES
               if finished? && !strike?
                 roll_one + roll_two
               else
                 roll_one
               end
             elsif finished? && !bonus_roll.nil?
               roll_one + roll_two + bonus_roll
             elsif finished?
               roll_one + roll_two
             else
               roll_one
             end
  end

  def strike?
    roll_one == STRIKE
  end

  def spare?
    !strike? && roll_one + roll_two == SPARE
  end

  def spare_or_strike?
    spare? || strike?
  end

  def finished?
    if number < TOTAL_NUMBER_OF_FRAMES
      # TRUE if NOT final frame AND (strike or two rolls)
      strike? || !roll_two.nil?
    elsif !roll_two.nil?
      if spare_or_strike?
        if strike? && roll_two < STRIKE
          true
        else
          !bonus_roll.nil?
        end
      else
        true
      end
    # TRUE if roll_two complere AND NOT (spare OR strike) otherwise FALSE
    else
      false
    end
  end

  def tenth_frame?
    number == 10
  end
end
