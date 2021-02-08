class Score
  attr_reader :scores

  def initialize
    @scores = []
  end

  def calculate(frame)
    update_if_needed(frame)
    if frame == [10]
      @scores << 'X'
    elsif frame.sum == 10
      @scores << '/'
    else
      @scores << frame.sum
    end
  end

  def strike?
    @scores.include?('X')
  end

  def spare?
    @scores.include?('/')
  end

  def consecutive_strikes?
    @scores.last(2) == ['X', 'X']
  end

  def update_if_needed(pins)
    update_spare(pins) if spare?
    update_consec_strikes(pins[0]) if consecutive_strikes?
    update_strike(pins) if strike? && pins.size == 2
  end

  def update_strike(frame)
    @scores[-1] = 10 + frame.sum
  end

  def update_spare(pins)
    @scores[-1] = 10 + pins
  end

  def update_consec_strikes(pins)
    @scores[-2] = 20 + pins
  end

  def calculate_last_frame(frame, frame_limit)
    @scores[frame_limit - 1] = frame.sum
    @scores.slice!(frame_limit..-1)
  end

  def total
    @scores.inject(:+)
  end
end
