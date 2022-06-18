class Game
  attr_reader :current_round, :total_score

  def initialize
    @current_round = 1
    @total_score = 0
  end

  def enter_score(score)
    next_round?
    @total_score += score
  end

  def next_round?
    @current_round += 1 unless @current_round == 10
  end
end
