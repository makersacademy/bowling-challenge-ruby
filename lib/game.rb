class Game

  def initialize 
    @rolls = []
  end

  def roll(pins)
    @rolls.push(pins)
  end

  def score
    result = 0
    rollindex = 0
    10.times do
      if strike?(rollindex)
        result += strikeScore(rollindex)
        rollindex += 1
      elsif spare?(rollindex)
        result += spareScore(rollindex)
        rollindex += 2
      else
        result += frameScore(rollindex)
        rollindex += 2
      end
    end
    result
  end

  def strike?(rollindex)
    @rolls[rollindex]  == 10
  end

  def strikeScore(rollindex)
    10 +  @rolls[rollindex + 1] + @rolls[rollindex + 2]
   end

  def spare?(rollindex)
    @rolls[rollindex] + @rolls[rollindex+ 1] == 10
  end

  def spareScore(rollindex)
   10 + @rolls[rollindex + 2]
  end

  def frameScore(rollindex)
    @rolls[rollindex] +@rolls[rollindex+ 1]
  end
end
