class Frame
  attr_reader :score, :rolls, :pins_down

  def initialize(rolls)
    fail 'rolls must be between 1 and 10' if invalid_input(rolls)
    @rolls = rolls
    @score = nil
    @pins_down = rolls.sum
  end

  def score
    if spare?
      @score
    else
      return @pins_down
    end
  end

  def strike?
    return @rolls == [10]
  end

  def spare?
    return @rolls.length == 2 && @rolls.sum == 10
  end

  def add_spare_bonus(frame)
    return @score = 10 + frame.rolls.first
  end

  private

  def invalid_input(rolls)
    return (rolls.first < 0 || rolls.first > 10) ||
          (rolls.last < 0 || rolls.last > 10)
  end
end