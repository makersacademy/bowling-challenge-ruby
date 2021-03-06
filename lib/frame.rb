class Frame
  TOTAL_PINS = 10

  attr_reader :score, :roll1, :roll2, :remaining_pins, :bonus

  def initialize
    @score = 0
    @bonus = 0
    @remaining_pins = TOTAL_PINS
  end

  def add_roll(pins)
    raise PinError if pins > remaining_pins

    self.roll2 = pins if roll1
    self.roll1 = pins unless roll2
    self.score += pins
    self.remaining_pins -= pins
  end

  def over?
    !!roll2 || roll1 == TOTAL_PINS
  end

  def spare?
    roll1 + roll2 == TOTAL_PINS
  end

  def strike?
    roll1 == TOTAL_PINS
  end

  def add_bonus(pins)
    self.bonus += pins
  end

  private

  attr_writer :score, :roll1, :roll2, :remaining_pins, :bonus
end
