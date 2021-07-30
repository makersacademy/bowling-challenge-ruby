class Score
  attr_reader :first_roll_pins, :second_roll_pins, :spare, :strike
  def initialize
    @first_roll_pins
    @second_roll_pins
    @spare = false
    @strike = false
  end

  def first_roll(pins:)
    @strike = true if pins == 10
    pins
  end

  def second_roll(pins:)
    pins
  end
end