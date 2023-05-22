class Frame
  attr_reader :score, :rolls

  def initialize(rolls)
    fail 'rolls must be between 1 and 10' if invalid_input(rolls)
    @rolls = rolls
  end

  def score
    return spare? || strike? ? @score : rolls.sum
  end

  def strike?
    @rolls == [10]
  end

  def spare?
    @rolls.length == 2 && @rolls.sum == 10
  end

  def add_strike_bonus(frame1, frame2=nil)
    if !frame1.strike?
      @score = 10 + frame1.rolls[0..1].sum
    elsif frame2 == nil
      @score = nil
    else
      @score = 20 + frame2.rolls.first
    end
  end

  def add_spare_bonus(frame)
    @score = 10 + frame.rolls.first
  end

  private

  def invalid_input(rolls)
    return (rolls.first < 0 || rolls.first > 10) ||
          (rolls.last < 0 || rolls.last > 10)
  end
end