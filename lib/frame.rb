class Frame
  TOTAL_PINS = 10

  attr_reader :remaining_pins, :bonus, :rolls

  def initialize
    @bonus = 0
    @rolls = []
    @remaining_pins = TOTAL_PINS
  end

  def score
    rolls.sum + bonus
  end

  def add_roll(pins)
    raise PinError if pins > remaining_pins

    self.remaining_pins -= pins
    rolls << pins
  end

  def over?
    rolls.count == 2 || strike?
  end

  def spare?
    remaining_pins.zero? && !strike?
  end

  def strike?
    rolls.first == TOTAL_PINS
  end

  def add_bonus(pins)
    self.bonus += pins
  end

  private

  attr_writer :remaining_pins, :bonus
end
