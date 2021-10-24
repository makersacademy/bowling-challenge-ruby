require_relative 'frame'

class Bowling

  attr_reader :scorecard

  def initialize(frame_class: Frame)
    @frames = []
    @frame_class = frame_class
  end

  def scorecard # to be extracted
    @frames.map{|frame| frame.total}
  end

  def total_score
    scorecard.sum
  end

  def roll(pins) # integer
    unless last_frame?
      update_frames(pins)
    else
      update_last_frame(pins)
    end
  end

  def update_frames(pins)
    @current_frame ||= @frame_class.new
    update_bonus_frames(pins) if bonus_frames
    update_current_frame(pins)
  end

  def update_bonus_frames(pins)
    bonus_frames.each { |frame| frame.update_total(pins) }
    bonus_frames.each  { |frame| frame.deduct_bonus_roll }
  end

  def update_current_frame(pins)
    @current_frame.add(pins)
    @current_frame.calculate_total
    store_frame if @current_frame.complete?
  end

  def update_last_frame(pins)
    @current_frame ||= @frame_class.new
    @current_frame.add(pins)
    update_bonus_frames(pins)
    @current_frame.calculate_bonus
    end_game if @current_frame.pins.length == 3
  end

  def end_game
    @current_frame.calculate_total
    @frames << @current_frame if @current_frame.pins.length == 3
    p "GAME OVER"
  end

  def last_frame?
    return if @frames.empty?
    @frames.length == 9
  end

  def store_frame
    @current_frame.calculate_bonus
    @frames << @current_frame
    @current_frame = nil
  end

  def bonus_frames
    return if @frames.empty?
    @frames.select {|frame| frame.active_bonus? }
  end

end
