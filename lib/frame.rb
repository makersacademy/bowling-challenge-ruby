require './lib/roll'
class Frame
  attr_reader :frame_scores, :bonus, :frame_total

  def initialize(roll: Roll.new)
    @frame_total = 0
    @frame_scores = []
    @roll = Roll.new
  end
  

  def start_roll(pins)
    pins + @frame_total <= 10 ? roll(pins) : raise("Too many pins!")
  end

  def roll(pins)
    @frame_scores << pins
    @frame_total = @roll.roll(pins)
    @bonus = @roll.strike_or_spare
  end

end