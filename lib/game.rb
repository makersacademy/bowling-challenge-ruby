class Game
  attr_reader :current_round, :total_score

  def initialize
    @current_round = 1
    @total_score = 0
  end

  def increase_score(score)
    @current_round += 1
    @total_score += score
  end
end
