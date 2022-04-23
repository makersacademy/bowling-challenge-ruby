class Game
  def initialize(rolls)
    @rolls = rolls
  end

  def score
    score = 0
    @rolls.each_with_index do |frame, i|
      score += frame.inject(0,:+)
      score += @rolls[i + 1][0] if score == 10
    end
    score
  end
end
