require_relative 'frame'

class Scorecard
  attr_reader :frames, :final_score

  def initialize(frame)
    @frames = [frame]
    @final_score = 0
  end

  def add_frame(frame)
    fail 'this game is over' if @frames.length >= 10
    calculate_spare_bonus(@frames.last, frame)
    calculate_strike_bonus(@frames.last, frame)
    second_strike_bonus(@frames[-2], frame) if @frames.length >= 2
    @frames << frame
    get_total if last_frame?
    running_total
  end

  def running_total
    @frames.map { |frame| frame.final_score }.sum
  end

  private

  def calculate_strike_bonus(frame, bonus_frame)
    return unless frame.is_strike?

    if @frames.length == 9
      bonus = bonus_frame.rolls[0] + bonus_frame.rolls[1]
    else
      bonus = bonus_frame.base_score
    end

    frame.add_bonus(bonus)
  end

  def last_frame?
    @frames.length == 10
  end

  def second_strike_bonus(frame, bonus_frame)
    return unless frame.is_strike? && @frames.last.is_strike?
    bonus = bonus_frame.rolls.first
    frame.add_bonus(bonus)
  end

  def calculate_spare_bonus(frame, bonus_frame)
    return unless frame.is_spare?
    bonus = bonus_frame.rolls.first
    frame.add_bonus(bonus)
  end

  def get_total
    @frames.each do |frame|
      @final_score += frame.final_score
    end
  end

end
