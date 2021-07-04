class FinalFrame
  attr_reader :rolls

  def initialize
    @rolls = []
  end

  def ended?
    return false unless made_two_moves?
    return true if pins_are_less_than_10
  end

  def add(roll = Roll.new(pins))
    @rolls << roll
  end

  def score
    if strike?
      10
    else
      count_pins_on_turn(1) + count_pins_on_turn(2)
    end
  end

  def bonus_score
    if strike?
      count_pins_on_turn(2) + count_pins_on_turn(3)
    elsif spare?
      count_pins_on_turn(3)
    else
      0
    end   
  end

  def spare?
    strike? ? false : count_pins_on_turn(1) + count_pins_on_turn(2) == 10
  end

  def strike?
    no_moves_made? ? false : count_pins_on_turn(1) == 10
  end

  private

  def count_pins_on_turn(number)
    @rolls[number - 1].pins
  end

  def no_moves_made?
    @rolls.empty?
  end

  def made_two_moves?
    @rolls.length == 2
  end

  def pins_are_less_than_10
    count_pins_on_turn(1) + count_pins_on_turn(2) < 10
  end

  def made_three_moves?
    @rolls.length == 3
  end

end
