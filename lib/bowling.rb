class Bowling
  def initialize
    @rolls = []
  end

  def roll pins
    @rolls << pins
  end

  def score
    # @rolls.reduce(:+)
    result = 0
    rollIndex = 0
    10.times do
      if  @roll[rollIndex] + @rolls[rollIndex + 1] == 10
        result += spareScore rollIndex
      else
      result += frameScore rollIndex
      end
      rollIndex += 2
    end
  result
  end

  def spare? rollIndex
    @roll[rollIndex] + @rolls[rollIndex + 1] == 10
  end

  def spareScore rollIndex
    @rolls[rollIndex] + @rolls[rollIndex + 1] + @rolls[rollIndex +2]
  end

  def frameScore rollIndex
    @rolls[rollIndex] + @rolls[rollIndex + 1]
  end
end