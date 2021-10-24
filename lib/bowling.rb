require_relative 'frame'

class Bowling

  def initialize(frame_class: Frame)
    @frames = []
    @frame_class = frame_class
  end

  def scorecard # to be extracted
    @frames.map { |frame| frame.total }
  end

  def total_score
    scorecard.sum
  end

  def roll(pins) # integer
    raise "Game Over!" if @over
    if last_frame?
      update_final_frame(pins)
    else
      update_frames(pins)
      store_frame if @current_frame.complete?
    end
  end

  def update_frames(pins)
    @current_frame ||= @frame_class.new
    update_bonus_frames(pins) if bonus_frames
    update_current_frame(pins)
  end

  def update_bonus_frames(pins) # refactor this
    bonus_frames.each { |frame| frame.update_total(pins) }
    bonus_frames.each { |frame| frame.deduct_bonus_roll }
  end

  def update_current_frame(pins)
    @current_frame.add(pins)
    @current_frame.calculate_total
  end

  def update_final_frame(pins)
    update_frames(pins)
    @current_frame.calculate_bonus
    end_game if last_frame_complete?
  end

  def end_game
    @current_frame.calculate_total
    @frames << @current_frame
    @over = true
  end

  def last_frame_complete?
    return false if @current_frame.pins.empty?
    return true if @current_frame.pins.length == 3
    @current_frame.pins.length == 2 unless @current_frame.active_bonus?
  end

  def last_frame?
    return false if @frames.empty?
    @frames.length == 9
  end

  def store_frame
    @current_frame.calculate_bonus
    @frames << @current_frame
    @current_frame = nil
  end

  def bonus_frames
    return if @frames.empty?
    @frames.select { |frame| frame.active_bonus? }
  end

end
