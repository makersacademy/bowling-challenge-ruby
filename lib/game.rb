require_relative 'points'
require_relative 'turn'

class Game
  attr_reader :pins_knocked_down  
  
  def inititalize(pins_knocked_down:)
    @pins_knocked_down = pins_knocked_down,

  end
end
