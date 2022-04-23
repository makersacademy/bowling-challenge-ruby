class Frame
  attr_reader :pins_remaining

  PINS = 10

  def initialize
    @rolls = []
    @pins_remaining = PINS
    @strike = false
    @spare = false
  end

  def add_roll(num)
    @pins_remaining -= num unless rolls > 2
    @rolls << num unless rolls > 2
  end

  def rolls
    @rolls.length
  end

  def first_roll
    @rolls[0]
  end

  def second_roll
    @rolls[1]
  end

  def bonus_roll
    @rolls[2]
  end

  def strike?
    @strike = true if @rolls.length == 1 && @pins_remaining.zero?
    @strike
  end

  def spare?
    @spare = true if @rolls.length == 2 && @pins_remaining.zero?
    @spare
  end
end
