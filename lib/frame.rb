class Frame
  attr_reader :pins, :rolls

  def initialize
    @pins = 10
    @rolls = []
  end

  def ended?
    made_two_moves? || strike?
  end

  def add(roll = Roll.new(pins))
    @rolls << roll
    deduct_pins(roll)
  end

  def score
    @rolls.map { |roll| roll.pins }.inject(:+)
  end

  def spare?
    strike? ? false : count_pins_on_turn(1) + count_pins_on_turn(2) == 10
  end

  def strike?
    no_moves_made? ? false : count_pins_on_turn(1) == 10
  end

  private
  def deduct_pins(roll)
    @pins -= roll.pins
  end

  def count_pins_on_turn(number)
    @rolls[number - 1].pins
  end

  def no_moves_made?
    @rolls.empty?
  end

  def made_two_moves?
    @rolls.length == 2
  end
end
