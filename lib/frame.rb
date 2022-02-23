# knows if it's a strike, spare or over
class Frame
  TOTAL_PINS = 10

  attr_reader :rolls, :bonus

  def initialize
    @bonus = 0
    @rolls = []
    @final = false
    @remaining_pins = TOTAL_PINS
  end

  def score
    rolls.sum + bonus
  end

  def add_roll(pins)
    pins = pins.abs
    raise PinError if pins > remaining_pins

    self.remaining_pins -= pins
    replace_pins if final? && !over?
    rolls << pins
  end

  def over?
    return rolls.count == 2 || strike? unless final?

    rolls.count == 3 || rolls.count == 2 && score < TOTAL_PINS
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

  def final
    @final = true
  end

  private

  attr_writer :bonus
  attr_accessor :remaining_pins


  def final?
    @final
  end

  def replace_pins
    self.remaining_pins = TOTAL_PINS
  end
end
