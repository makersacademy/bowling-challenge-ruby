class Game
  def initialize(rolls)
    game = 9.times.map { rolls[0] == 10 ? rolls.shift(1) : rolls.shift(2) }
    game  << rolls.shift(rolls.length)
    @game = game.map { |frame| Frame.new(frame) }
  end

  def frames
    @game
  end
end