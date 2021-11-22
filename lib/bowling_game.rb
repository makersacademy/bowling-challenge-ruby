class BowlingGame
  def initialize
    @rolls = []
  end

  def roll(roll)
    @rolls << roll
  end

  def score
    count = 0
    score = 0
    while count < 20
      score += @rolls[count]
      count += 1
    end
    score
  end
end
