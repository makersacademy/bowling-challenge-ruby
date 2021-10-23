require 'frame'
# 10 pins
# 10 frames
# 1 or 2 rolls per frame
# frame score = knocked down pins + strike/spare bonuses
# pins reset to 10 each frame

# strikes = 10 pins in first roll of frame. frame ends. bonus = number of pins from the next 2 rolls (unless a strike)
# spares = 10 pins in 2 rolls of frame. bonus = number of pins from next roll

# 10th frame - max 3 rolls
# strike or spare = immediate bonus roll

class Bowling

  attr_reader :scorecard

  def initialize(frame_class: Frame)
    @frames = []
    @frame_class = frame_class
    @current_frame = @frame_class.new
  end

  def scorecard
    @frames.map{|frame| frame.total}
  end

  def total_score
    scorecard.sum
  end

  def roll(pins) # integer
    update_previous_frame(pins) if ongoing_bonus?
    update_current_frame(pins)
  end

  def ongoing_bonus?
    return if @frames.empty?
    @frames.last.active_bonus?
  end

  def update_previous_frame(pins)
    @frames.last.add(pins)
    @frames.last.total unless @frames.last.active_bonus?
  end

  def update_current_frame(pins)
    @current_frame.add(pins)
    store_frame if @current_frame.complete?
    @current_frame ||= @frame_class.new
  end

  def store_frame
    @current_frame.calculate_bonus
    @current_frame.total unless @current_frame.active_bonus?
    @frames << @current_frame
    @current_frame = nil
  end

end
