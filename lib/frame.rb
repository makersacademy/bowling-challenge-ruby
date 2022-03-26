class Frame
  FRAME_LENGTH = 2
  TOTAL_PINS = 10
  SPARE_BONUS_ROLLS = 1
  STRIKE_BONUS_ROLLS = 2

  attr_reader :number, :scores

  def initialize(frame_number)
    @number = frame_number
    @scores = []
    @bonus_points = []
  end

  def score
    @scores.sum + bonus
  end

  def add(score_to_add)
    raise 'This frame is complete' if complete?

    @scores << score_to_add
  end

  def rolls
    @scores.length
  end

  def bonus
    return 0 unless strike? || spare?
    @bonus_points.sum
  end

  def bonus_complete?
    return @bonus_points.length == SPARE_BONUS_ROLLS if spare?
    return @bonus_points.length == STRIKE_BONUS_ROLLS if strike?
    true
  end

  def increase_bonus(increase)
    @bonus_points << increase
  end

  def complete?
    return true if strike?

    rolls == FRAME_LENGTH
  end

  def strike?
    @scores.first == TOTAL_PINS
  end

  def spare?
    @scores.length == FRAME_LENGTH && @scores.sum == TOTAL_PINS
  end
end
