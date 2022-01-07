class BowlingGame

  def initialize
    @rolls = []
  end

  def rolls(pins)
    @rolls.push(pins)
  end
    
  def score
    totalScore = 0
    rollTurn = 0
    10.times do
      if strike?(rollTurn)
        totalScore += strikeScore(rollTurn)
        rollTurn += 1 
     elsif spare?(rollTurn)
        totalScore += spareScore(rollTurn)
        rollTurn += 2
      else
        totalScore += @rolls[rollTurn] + @rolls[rollTurn + 1]
        rollTurn += 2
      end
    end
    totalScore
  end

  def spare?(rollTurn)
    @rolls[rollTurn] + @rolls[rollTurn + 1] == 10
  end

  def strike?(rollTurn)
    @rolls[rollTurn] == 10
  end

  def strikeScore(rollTurn)
    10 + @rolls[rollTurn + 1] + @rolls[rollTurn + 2]
  end

  def spareScore(rollTurn)
    10 + @rolls[rollTurn + 2]
  end
end
