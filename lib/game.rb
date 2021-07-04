class Game
  attr_reader :score

  def initialize
    @score = 0
  end

  def roll(pins, roll = Roll.new)
    roll.pins = pins
    @score += roll.pins
  end
end
