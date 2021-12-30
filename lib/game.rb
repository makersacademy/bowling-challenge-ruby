class Game
  def initialize
    @rolls = [] 
  end

  def roll(pins)
    @rolls.push(pins)
  end

  def points
    frame_points = 0
    rollIndex = 0
    # calculates points per game frames(ten)
    10.times do
      if isStrike?(rollIndex)
        frame_points +=  @rolls[rollIndex] + @rolls[rollIndex + 1] + @rolls[rollIndex + 2]
        rollIndex += 1
      elsif isSpare?(rollIndex)
        frame_points += sparePoints(rollIndex)
        rollIndex += 2
      else
        frame_points += @rolls[rollIndex] + @rolls[rollIndex + 1]
        rollIndex += 2
      end
    end
    frame_points
  end

def isSpare?(rollIndex)
  @rolls[rollIndex] + @rolls[rollIndex + 1] == 10
end

def sparePoints(rollIndex)
  @rolls[rollIndex] + @rolls[rollIndex + 1] + @rolls[rollIndex + 2]
end

def isStrike?(rollIndex)
  @rolls[rollIndex] == 10
end



end