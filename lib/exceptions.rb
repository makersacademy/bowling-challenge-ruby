# raises when player inputs a roll > than remaining pins
class PinError < RuntimeError
  attr_reader :msg

  def initialize(msg = 'Number must be less than remaining pins')
    @msg = msg
    super(msg)
  end
end

# raises when player inputs a roll after the game has finished
class GameOverError < RuntimeError
  attr_reader :msg

  def initialize(msg = 'This game is over, start a new game to play again')
    @msg = msg
    super(msg)
  end
end
