class Frame
  attr_reader :score, :roll1, :roll2, :remaining_pins

  def initialize
    @score = 0
    @remaining_pins = 10
  end

  def add_roll(pins)
    raise PinError if pins > remaining_pins
    self.roll2 = pins if roll1
    self.roll1 = pins unless roll2
    self.score += pins
  end

  def over?
    !!roll2 || roll1 == 10
  end

  private

  attr_writer :score, :roll1, :roll2
end
