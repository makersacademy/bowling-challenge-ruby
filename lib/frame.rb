class Frame

  INITIAL_PINS = 10

  attr_reader :pins_left, :rolls, :frame_score, :strike, :spare

  def initialize(pins_left = INITIAL_PINS)
    @pins_left = pins_left
    @rolls = []
    @frame_score = 0
    @strike = nil
    @spare = nil
  end

  def roll(number)
    input_validation(number)
    max_two_rolls
    roll = Roll.new(number)
    rolls.push(roll)
    @pins_left -= number
    @frame_score += roll.pins_knocked_down
    strike?(roll.pins_knocked_down)
    spare?(number)
  end

  private
  def input_validation(number)
    fail "Wrong pins number" if pins_left < number
  end

  def max_two_rolls
    fail "Unexpected third roll??" if rolls.length == 2
  end

  def strike?(number)
    @strike = true if number == 10

  end

  def spare?(number)
    @spare = true if number != 10 && @pins_left.zero?
  end
end
