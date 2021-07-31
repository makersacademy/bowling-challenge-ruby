class Score
  attr_reader :first_roll_pins, :second_roll_pins, :spare, :strike
  def initialize
    @first_roll_pins
    @second_roll_pins
    @spare = false
    @strike = false
    @score
  end

  def first_roll(pins:)
    @first_roll_pins = pins
    determine_strike
  end

  def second_roll(pins:)
    @second_roll_pins = pins
    determine_spare
  end

  def determine_strike
    @strike = true if first_roll_pins == 10
  end

  def determine_spare
    @spare = true if @first_roll_pins + @second_roll_pins == 10
  end

  def calculate_score
    !@spare && !@strike ?
    @score = @first_roll_pins + @second_roll_pins : @score = 0
  end
end