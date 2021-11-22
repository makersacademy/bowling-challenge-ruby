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
      if @rolls[count] + @rolls[count + 1] == 10
        score += @rolls[count] + @rolls[count + 1] + @rolls[count + 2]
      else
        score += @rolls[count] + @rolls[count + 1]
      end
      count += 2
    end
    p score
    score
  end
end
