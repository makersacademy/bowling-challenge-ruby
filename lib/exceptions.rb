# raises when player inputs a roll > than remaining pins
class PinError < RuntimeError
  attr_reader :message

  def initialize(message = 'Number must be less than remaining pins')
    @message = message
    super(message)
  end
end

# raises when player inputs a roll after the game has finished
class GameOverError < RuntimeError
  attr_reader :message

  def initialize(message = 'This game is over, start a new game to play again')
    @message = message
    super(message)
  end
end
