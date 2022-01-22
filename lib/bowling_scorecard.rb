require 'frame'

class BowlingScorecard
  
  attr_reader :rolls
  
  def initialize(frame = Frame)
    @frame = frame
    @rolls = []
    @total_score = 0
  end

  def add_knocked_pins(pins)
    raise "This is a 10 pin bowling game!" if too_many_pins?(pins)
    @rolls << pins
    @rolls << 0 if pins == 10
    @total_score += pins
    set_frame if @rolls.count == 2
  
  end

  def total_score
    @total_score
  end

  private

  def set_frame
    @current_frame = @frame.new(@rolls[0], @rolls[1])
    @rolls = []
    
  end

  def too_many_pins?(pins)
    (@rolls.sum + pins) > 10
  end
end
