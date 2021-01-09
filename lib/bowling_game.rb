class BowlingGame
  def initialize
    @rolls = []
  end

  def roll(pins)
    @rolls.push(pins)
  end

  def score
    result = 0
    rollIndex = 0
    10.times do
      if spare?(rollIndex)
        result += spareScore(rollIndex)
      else
        result += frameScore(rollIndex)
      end
      rollIndex += 2
    end
    result
  end

  private

  def spare?(rollIndex)
    @rolls[rollIndex] + @rolls[rollIndex + 1] == 10
  end

  def spareScore(rollIndex)
    10 + @rolls[rollIndex + 2]
  end

  def frameScore(rollIndex)
    @rolls[rollIndex] + @rolls[rollIndex + 1]
  end
end
