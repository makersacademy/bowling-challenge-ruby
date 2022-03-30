class BowlingGame

  def initialize
    # saves score for each roll
    @rolls = []
  end

  def roll(pins)
    # pushes how many pins knocked down per roll in @rolls array
    @rolls << pins
  end

  def score
    result = 0
    rollIndex = 0
    # 10 'frames' per game
    10.times do
      # players scores 10 on first roll in frame
      if strike?(rollIndex)
        result += strikeScore(rollIndex)
        rollIndex += 1
      elsif spare?(rollIndex)
        result += spareScore(rollIndex)
        rollIndex += 2
      else
        result += frameScore(rollIndex)
        rollIndex += 2
      end
    end
    result
  end

private

  def strike?(rollIndex)
    # score of 10 added to result
    @rolls[rollIndex] == 10
  end

  def spare?(rollIndex)
    #score for 2nd roll (spare) added to result, plus this 2nd roll total added to next roll total result
    @rolls[rollIndex] + @rolls[rollIndex + 1] == 10
  end

  def strikeScore(rollIndex)
    # score of 10 added to result, plus rollIndex moves 2 spaces ahead (3rd roll)
    10 + @rolls[rollIndex + 1] + @rolls[rollIndex + 2]
  end

  def spareScore(rollIndex)
    # score of 10 added to result, plus rollIndex moves 2 spaces ahead (3rd roll)
    10 + @rolls[rollIndex + 2]
  end

  def frameScore(rollIndex)
    # 2 rolls per frame
    @rolls[rollIndex] + @rolls[rollIndex + 1]
  end

end
