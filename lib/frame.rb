require 'player'

class Frame

  def initialize(player)
    @stats = {roll_one: 0, roll_two: 0, special: 'none', score: 0}
    @player = player
  end

  def roll_one(x)
    if x == 10
      @stats[:special] = 'STRIKE'
      @stats[:roll_one] = 'X'
      @stats[:score] += 10
    else
      @stats[:roll_one] += x
      @stats[:score] += x
    end
  end

  def roll_two(x)
    if x + @stats[:roll_one] >= 10
      @stats[:special] = 'SPARE'
      @stats[:roll_two] = '/'
      @stats[:score] = 10
    else
      @stats[:roll_two] += x
      @stats[:score] += x
    end
  end

  def end_frame
    return @stats
  end
end