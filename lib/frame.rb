class Frame

  attr_reader :total_score

  def initialize
    @total_score = 0
  end

  def add_score(score)
    @total_score += score
  end

  def add_bonus_score(score)
    @total_score += score
  end

end
