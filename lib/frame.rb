class Frame
  attr_reader :rolls, :pins_remaining

  PINS = 10

  def initialize
    @rolls = []
    @pins_remaining = PINS
  end

  def add_roll(n)
    @rolls << n
  end

  def first_roll
    @rolls[0]
  end

  def second_roll
    @rolls[1]
  end

  def third_roll
    @rolls[2]
  end

end
