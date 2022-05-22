require_relative './spare'
require_relative './strike'

class Scorecard

  attr_reader :frame, :roll, :spares, :strikes, :score, :first_roll, :third_roll

  def initialize
    @frame = 1
    @roll = 1
    @spares = []
    @strikes = []
    @score = 0
    @first_roll = 0
    @third_roll = false
  end

  def next_frame
    @frame += 1 unless frame == 10
  end

  def next_roll
    if frame == 10
      @roll += 1 unless roll >= 3
    else
      @roll += 1 unless roll >= 2
    end
  end

  def reset_roll
    @roll = 1
  end

  def add_spare(spare = Spare.new)
    @spares << spare
  end

  def add_strike(strike = Strike.new)
    @strikes << strike
  end

  def add_spare_score
    @score += spares.shift.score
  end

  def add_strike_score
    @score += strikes.shift.score
  end

  def show_score
    "Frame: #{frame}    Score: #{score}"
  end

  def insert_play(pins)
    if frame == 10
      play_last_frame(pins)
    elsif roll == 1
      play_first_roll(pins)
    else
      play_second_roll(pins)
    end
  end

  def play_first_roll(pins)
    fail if pins > 10
    check_spares(pins)
    check_strikes(pins)
    if pins == 10
      add_strike
      puts show_score
      next_frame
    else
      @first_roll = pins
      next_roll
    end
  end

  def play_second_roll(pins)
    fail if (first_roll + pins) > 10
    check_spares(pins)
    check_strikes(pins)
    if (first_roll + pins) == 10
      add_spare
    else
      @score += (first_roll + pins)
    end
    puts show_score
    @first_roll = 0
    reset_roll
    next_frame
  end

  def play_last_frame(pins)
    fail if pins > 10
    if roll == 1
      last_frame_first(pins)
    elsif roll == 2
      last_frame_second(pins)
    else
      check_spares(pins) if strikes.empty?
      check_strikes(pins)
      puts show_score
    end
  end

  def last_frame_first(pins)
    check_spares(pins)
    check_strikes(pins)
    if pins == 10
      add_strike
      @third_roll = true
    else
      @first_roll = pins
    end
    next_roll
  end

  def last_frame_second(pins)
    check_spares(pins)
    check_strikes(pins)
    if (first_roll + pins) == 10
      add_spare
      @third_roll = true
    else
      @score += (first_roll + pins)
    end
    if third_roll
      next_roll
    else
      puts show_score
    end
  end

  def check_spares(pins)
    return if spares.empty?
    spares.first.add(pins)
    add_spare_score if spares.first.complete?
  end

  def check_strikes(pins)
    return if strikes.empty?
    strikes.first.add(pins) unless strikes.empty?
    return unless strikes.first.complete?
    add_strike_score
    # strikes.first.add(pins) unless strikes.empty?
    check_strikes(pins)
  end

end
