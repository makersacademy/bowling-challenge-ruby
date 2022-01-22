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
    set_frame(pins)

    @total_score += pins
  end

  def total_score
    @total_score
  end

  private

  def set_frame(pins)
    @rolls << pins
    @rolls << 0 if pins == 10
    reset_frame if @rolls.count == 2
  end

  def reset_frame
    @total_score += @rolls.sum if last_frame_strike?

    @current_frame = @frame.new(@rolls[0], @rolls[1])
    @rolls = []
  end

  def last_frame_strike?
    @current_frame and @current_frame.strike?
  end

  def too_many_pins?(pins)
    (@rolls.sum + pins) > 10
  end
end
