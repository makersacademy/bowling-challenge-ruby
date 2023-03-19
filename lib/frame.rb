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

  # METHODS FOR TENTH FRAME SPARE OR STRIKE
  def frame_ten_roll_two(x)
    if x == 10
      @stats[:roll_two] = 'X'
      @stats[:score] += 10
    else
      @stats[:roll_two] += x
      @stats[:score] += x
    end
  end

  def frame_ten_roll_three(x)
    @stats[:roll_three] = 0
    if x == 10
      @stats[:special] = 'STRIKE'
      @stats[:roll_three] = 'X'
      @stats[:score] += 10
    else
      @stats[:roll_three] += x
      @stats[:score] += x
    end
  end

  def stats
    return @stats
  end
end