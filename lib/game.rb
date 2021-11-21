class Game
  def initialize
    @rolls = [] 
  end

  def roll(pins)
    @rolls.push(pins)
  end

  def points
    # points = @rolls.sum
    frame_points = 0
    rollIndex = 0
    # calculates points per game frames(ten)
    10.times do
      if @rolls[rollIndex] + @rolls[rollIndex + 1] == 10
        frame_points += @rolls[rollIndex] + @rolls[rollIndex + 1] + @rolls[rollIndex + 2]
      else
        frame_points += @rolls[rollIndex] + @rolls[rollIndex + 1]
      end
      rollIndex += 2
    end
    frame_points
  end

end