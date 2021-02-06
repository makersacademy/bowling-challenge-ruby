class Game
  attr_reader :total_score, :current_bowl

  def initialize
    @total_score = 0
    @current_bowl = 1
  end

  def enter_score(score)
    @total_score += score
    @current_bowl = 2
  end

end
