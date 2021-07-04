class BowlingScore
  def initialize
    @current_score = 0
  end

  def hit(number)
    @current_score += number
  end

  def current_score
    @current_score
  end
end