class Game
  def initialize(rolls)
    @rolls = rolls
  end

  def score
    score = 0
    @rolls.each do |frame|
      score += frame.inject(0,:+)
    end
    score
  end
end
