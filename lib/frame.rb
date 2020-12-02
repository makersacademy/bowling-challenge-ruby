class Frame
  attr_reader :score, :rolls, :in_play, :frame_10

  def initialize(frame_10 = false)
    @rolls = []
    @score = 0
    @in_play = true
    @frame_10 = frame_10
  end


  def knocked(pins)
   @rolls << pins
   @score += pins
   frame_check
   strike_check
  end
  

  def frame_check
    close_play if (@rolls.length == 2) && !@frame_10
  end

  def strike_check
    close_play if (@rolls[0] == 10) && !@frame_10
  end

  def strike?
    return true if rolls.first == 10
  end
  
  def point_bonus(pins)
    @score += pins
  end

  def spare?
    return false if strike?
    return true if rolls.inject(:+) == 10
  end

  def close_play
    @in_play = false
  end

end