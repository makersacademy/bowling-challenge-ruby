require 'frame'

class BowlingScorecard
  
  attr_reader :rolls, :frames
  
  def initialize(frame = Frames.new)
    @rolls = []
    @frames = frame
    @total_score = 0
  end

  def add_knocked_pins(pins)
    raise "This is a 10 pin bowling game!" if too_many_pins?(pins)
    @rolls << pins
    set_new_frame if @rolls.count == 2 or pins == 10 or @frames.tenth_frame?
  end

  def total_score
    @total_score = @frames.total_points
  end

  def set_new_frame
    @frames.create_new(@rolls)
    @rolls = []
  end

  private

  def too_many_pins?(pins)
    (@rolls.sum + pins) > 10
  end
end
