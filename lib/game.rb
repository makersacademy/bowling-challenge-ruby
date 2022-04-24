require_relative './frame'

class Game

  attr_reader :frame, :total_score, :bonus_points

  def initialize(frame = Frame.new)
    @frame = frame
    @bonus_roll = 0
    @total_score = 0
    @bonus_points = 0
  end

  def calculate_total_score(num)
    if @bonus_points > 0
      num += @bonus_points
      p "NUM:"
      p num
      @bonus_points = 0
    end

    @frame.knocked_down_pins(num)
    

    if bonus_roll == 1
      @bonus_points = @frame.knocked_down_pins_log[0]
    elsif bonus_roll == 2
      @bonus_points = @frame.knocked_down_pins_log[0]
      @bonus_points += @frame.knocked_down_pins_log[1]
    else @total_score += @frame.knocked_down_pins_log.sum
    end

  end

  def reset_knocked_down_pins_log
    if strike?
      @frame.reset_knocked_down_pins_log
    elsif spare?
      @frame.reset_knocked_down_pins_log
    elsif @frame.knocked_down_pins_log.length == 2
      @frame.reset_knocked_down_pins_log
    else 
      return
    end
  end

  def spare?
    if @frame.knocked_down_pins_log.sum == 10 && @frame.knocked_down_pins_log.length == 2
      true
    else false
    end
  end

  def strike?
    if @frame.knocked_down_pins_log.sum == 10 && @frame.knocked_down_pins_log.length == 1
      true
    else false
    end
  end

  def bonus_roll
    if spare?
      @bonus_roll = 1
    elsif strike?
      @bonus_roll = 2
    else @bonus_roll
    end
  end
end
