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
      if @rolls[rollIndex] == 10
        frame_points +=  @rolls[rollIndex] + @rolls[rollIndex + 1] + @rolls[rollIndex + 2]
        rollIndex += 1
      elsif @rolls[rollIndex] + @rolls[rollIndex + 1] == 10
        frame_points += @rolls[rollIndex] + @rolls[rollIndex + 1] + @rolls[rollIndex + 2]
        rollIndex += 2
      else
        frame_points += @rolls[rollIndex] + @rolls[rollIndex + 1]
        rollIndex += 2
      end
    end
    frame_points
  end

end