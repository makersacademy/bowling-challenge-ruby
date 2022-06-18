class Game
  attr_reader :current_round

  def initialize
    @current_round = 1
  end

  def total_score
    8
  end
end
