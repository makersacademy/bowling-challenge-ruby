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
    10.times do
      if strike?(count)
        score += strikeScore(count)
        count += 1
      elsif spare?(count)
        score += spareScore(count)
        count += 2
      else
        score += frameScore(count)
        count += 2
      end
    end
    score
  end

  def strike?(count)
    @rolls[count] == 10
  end

  def strikeScore(count)
    @rolls[count + 1] + @rolls[count + 2] + 10
  end

  def spare?(count)
    @rolls[count] + @rolls[count + 1] == 10
  end

  def spareScore(count)
    @rolls[count + 2] + 10
  end

  def frameScore(count)
    @rolls[count] + @rolls[count + 1]
  end
end
