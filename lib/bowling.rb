require_relative 'frame'

class Bowling
  
  attr_reader :frames

  def initialize(frame_class: Frame, final_frame_class: FinalFrame)
    @frames = []
    @frame_class = frame_class
    @final_frame_class = final_frame_class
  end

  def calculate_full_game(rolls)
    rolls.each { |pins| roll(pins) }
    return total_score
  end

  def total_score
    @frames.sum(&:total)
  end

  def roll(pins) # integer
    raise "Game Over!" if @game_over
    if final_frame?
      update_final_frame(pins)
    else
      update_frames(pins)
      store_frame if @current_frame.complete?
    end
  end

  private

  def update_frames(pins)
    @current_frame ||= @frame_class.new
    update_bonus_frames(pins) if bonus_frames
    update_current_frame(pins)
  end

  def bonus_frames
    return if @frames.empty?
    @frames.select { |frame| frame.active_bonus? }
  end

  def update_bonus_frames(pins)
    bonus_frames.each do |frame|
      frame.update_total(pins)
      frame.deduct_bonus_roll
    end
  end

  def update_current_frame(pins)
    @current_frame.add(pins)
    @current_frame.calculate_total
  end

  def update_final_frame(pins)
    @current_frame ||= @final_frame_class.new
    update_frames(pins)
    @current_frame.calculate_bonus
    # calculate bonus here because it won't be checked after if game over 
    end_game if @current_frame.complete?
  end

  def store_frame
    @current_frame.calculate_bonus
    @frames << @current_frame
    @current_frame = nil
  end

  def final_frame?
    return false if @frames.empty?
    @frames.length == 9
  end

  def end_game
    store_frame
    @game_over = true
    p "Game Over!"
  end

end
