require_relative 'frame'

class BowlingGame
  def initialize
    @score, @roll_number = 0, 0
    @rolls = []
  end

  def bowl(pins, frame = Frame)
    if regular_strike(pins)
      create_strike_frame(pins, frame)
    elsif final_frame?
      @rolls.last.add_bonus(pins)
    elsif first_roll?
      create_new_frame(pins, frame)
    else
      close_frame(pins, frame)
    end
  end

  def score
    calculate_score
    @score
  end

  private 

  def calculate_score
    @rolls.each_with_index do |frame, index|
      if frame.strike?
        frame.bonus_frame? ? score_frame(frame) : score_regular_strike(frame, index)
      elsif frame.spare?
        score_regular_spare(frame, index)
      else 
        score_frame(frame)
      end
    end
  end

  def close_frame(pins, frame)
    @frame.add_to_frame(pins)
    @rolls << @frame
    @roll_number += 1
  end

  def create_new_frame(pins, frame)
    @frame = frame.new
    @frame.add_to_frame(pins)
    @roll_number += 1
  end

  def create_strike_frame(pins, frame)
    @frame = frame.new
    complete_frame(pins)
    @roll_number += 2
  end

  def final_frame?
    @roll_number == 20
  end

  def score_frame(frame)
    @score += frame.total
  end

  def score_regular_spare(frame, index)
    @score += frame.total + @rolls[index + 1].first_roll
  end

  def score_regular_strike(frame, index)
    bonus = followed_by_strike?(index) ? @rolls[index + 1].first_roll + @rolls[index + 2].first_roll : @rolls[index + 1].first_two
    @score += 10 + bonus
  end

  def followed_by_strike?(index)
    @rolls[index + 1].first_roll == 10 && @rolls[index + 2]
  end

  def regular_strike(pins)
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
end
