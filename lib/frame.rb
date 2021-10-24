class Frame
  attr_reader :pins, :bonus_rolls, :total

  def initialize
    @pins = []
    @bonus_rolls = 0
    @total = 0
  end

  def add(pins)
    @pins << pins
  end

  def strike?
    @pins.include?(10)
  end

  def spare?
    return false unless @pins.length >= 2
    @pins.max <= 9 && @pins.sum == 10
  end

  def calculate_bonus
    @bonus_rolls = 0 unless strike? || spare?
    @bonus_rolls = 1 if spare?
    @bonus_rolls = 2 if strike?
  end

  def active_bonus?
    @bonus_rolls.positive?
  end

  def deduct_bonus_roll
    @bonus_rolls -= 1
  end

  def calculate_total
    @total = @pins.sum
  end

  def update_total(number)
    @total += number
  end

  def complete?
    @pins.count == 2 || strike?
  end

end
