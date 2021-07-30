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
    @first_roll_pins = pins
  end

  def second_roll(pins:)
    @second_roll_pins = pins
    @spare = true if @first_roll_pins + @second_roll_pins == 10
  end
end