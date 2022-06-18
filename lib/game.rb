class Game
  attr_reader :current_round, :total_score, :is_strike

  def initialize
    @current_round = 1
    @total_score = 0
    @is_strike = false
  end

  def enter_score(score)
    strike?(score)
    next_round?
    @total_score += score
  end

  def next_round?
    @current_round += 1 unless @current_round == 10
  end

  def strike?(score)
    score == 10 ? @is_strike = true : @is_strike = false
  end
end
