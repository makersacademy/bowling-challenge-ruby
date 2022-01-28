class Roll
  attr_reader :frame_score

  def initialize
    @frame_score = 0
  end
  
  def roll(pins)
    @pins = pins
    @frame_score += @pins
  end

  def strike_or_spare
    @pins == 10 ? 'strike' : (@frame_score == 10 ? 'spare' : 'none' )
  end
end