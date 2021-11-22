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
      if spare?(count)
        score += spareScore(count)
      else
        score += @rolls[count] + @rolls[count + 1]
      end
      count += 2
    end
    score
  end

  def spare?(count)
    @rolls[count] + @rolls[count + 1] == 10
  end

  def spareScore(count)
    @rolls[count] + @rolls[count + 1] + @rolls[count + 2]
  end
end
