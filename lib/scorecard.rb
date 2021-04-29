require_relative 'frame'

class Scorecard
  attr_reader :frames, :final_score

  def initialize(frame)
    @frames = [frame]
    @final_score = 0
  end

  def add_frame(frame)
    fail 'this game is over' if game_finished?
    bonuses(frame)
    @frames << frame
    get_total if game_finished?
    running_total
  end

  def running_total
    @frames.map { |frame| frame.final_score }.sum
  end

  private

  def bonuses(frame)
    calculate_spare_bonus(@frames.last, frame)
    calculate_strike_bonus(@frames.last, frame)
    consecutive_strikes_bonus(@frames[-2], frame) if @frames.length >= 2
  end

  def calculate_strike_bonus(frame, bonus_frame)
    return unless frame.is_strike?

    if @frames.length == 9
      bonus = bonus_frame.rolls[0] + bonus_frame.rolls[1]
    else
      bonus = bonus_frame.base_score
    end

    frame.add_bonus(bonus)
  end

  def game_finished?
    @frames.length == 10
  end

  def consecutive_strikes_bonus(frame, bonus_frame)
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
