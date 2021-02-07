class Score

  attr_reader :scores

  def initialize
    @scores = []
  end

  def calculate(frame)
    if frame == [10]
      @scores << 'X'
    elsif frame.sum == 10
      @scores << '/'
    else
      @scores << frame.sum
    end
  end

  def spare_in_progress?
    @scores.include?('/')
  end

  def strike_in_progress?
    @scores.include?('X')
  end

  def consecutive_strikes?
    @scores.last(2) == ['X', 'X']
  end

  def update_normal(pins)
    update_spare(pins) if spare_in_progress?
    update_consec_strikes(pins[0]) if consecutive_strikes?
    update_strike(pins) if strike_in_progress? && pins.size == 2
  end

  def spare(pins)
    @scores[-1] = 10 + pins
  end

  def strike(frame)
    @scores[-1] = 10 + frame.sum
  end

  def consecutive_strikes(pins)
    @scores[-2] = 20 + pins
  end

end
