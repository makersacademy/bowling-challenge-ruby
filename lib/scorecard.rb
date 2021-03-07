require_relative 'frame'

class Scorecard
  attr_reader :frames, :total_score

  def initialize(frame)
    @frames = [frame]
    @total_score = 0
  end

  def add_frame(frame)
    calculate_spare_bonus(@frames.last, frame) if @frames.last.is_spare?
    calculate_strike_bonus(@frames.last, frame) if @frames.last.is_strike?
    if @frames.length >= 2
      second_strike_bonus(@frames[-2], frame) if (@frames.last.is_strike? && @frames[-2].is_strike?)
    end
    @frames << frame
    get_total if @frames.length == 10
  end

  def calculate_strike_bonus(frame, bonus_frame)
    if @frames.length == 9
      bonus = bonus_frame.rolls[0] + bonus_frame.rolls[1]
    else
      bonus = bonus_frame.base_score
    end

    frame.add_bonus(bonus)
  end

  def second_strike_bonus(frame, bonus_frame)
    bonus = bonus_frame.rolls.first
    frame.add_bonus(bonus)
  end

  def calculate_spare_bonus(frame, bonus_frame)
    bonus = bonus_frame.rolls.first
    frame.add_bonus(bonus)
  end

  def get_total
    @frames.each do |frame|
      @total_score += frame.final_score
    end
  end

end
