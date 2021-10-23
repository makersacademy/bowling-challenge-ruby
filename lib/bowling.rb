require 'frame'

class Bowling

  attr_reader :scorecard

  def initialize(frame_class: Frame)
    @frames = []
    @frame_class = frame_class
  end

  def frames_and_totals # for testing purposes only, easier to visualise
    @frames.each do |frame|
      p frame.pins
      puts frame.total
    end
  end

  def scorecard
    @frames.map{|frame| frame.total}
  end

  def total_score
    scorecard.sum
  end

  def roll(pins) # integer
    @current_frame ||= @frame_class.new
    update_previous_frame(pins) if active_bonus?
    update_current_frame(pins)
  end

  def active_bonus?
    return if @frames.empty? # for the first roll
    previous_frame.active_bonus?
  end

  def update_previous_frame(pins)
    previous_frame.update_total(pins)
    previous_frame.deduct_bonus_roll
  end

  def update_current_frame(pins)
    @current_frame.add(pins)
    @current_frame.calculate_total
    store_frame if @current_frame.complete?
  end

  def store_frame
    @current_frame.calculate_bonus
    @frames << @current_frame
    @current_frame = nil
  end

  def previous_frame
    @frames.last
  end

end
