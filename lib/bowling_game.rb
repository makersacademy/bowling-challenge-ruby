class BowlingGame
  def initialize(turn_manager = TurnManager.new)
    @turn_manager = turn_manager
  end

  def roll(number)
    @turn_manager.move(number)
  end

  def frame
    @turn_manager.frame
  end
end
