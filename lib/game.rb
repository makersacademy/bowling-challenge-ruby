class Game
  attr_reader :score

  def initialize(roll_class = Roll)
    @score = 0
    @roll_class = roll_class
  end

  def roll(pins)
    roll = @roll_class.new
    roll.pins = pins
    @score += roll.pins
  end
end
