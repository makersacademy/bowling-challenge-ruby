require_relative 'roll'

class Game

  def roll(pins, roller = Roll.new)
    roller.roll(pins)
  end

end
