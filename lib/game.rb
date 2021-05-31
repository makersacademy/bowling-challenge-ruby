require_relative './frame'

class Game
  FRAME_PINS = 10
  FRAME_ROLLS = 2
  MAX_FRAMES = 10

  def initialize
    @frames = [Frame.new]
  end

  def total_score
    @frames.reduce(0) { |sum, frame| sum + frame.score }
  end

  def bowl(pinfall)
    return total_score if @frames.length > MAX_FRAMES

    current_frame.roll(pinfall)
    distribute_bonuses(pinfall)
    new_frame if current_frame_over?
    total_score
  end

  def distribute_bonuses(pinfall)
    return unless previous_frame

    previous_frame.add_bonus(pinfall) if previous_frame.strike? && current_frame.rolls < 3
    previous_frame.add_bonus(pinfall) if previous_frame.spare? && current_frame.rolls < 2

    return unless previous_previous_frame

    if previous_previous_frame.strike? && current_frame.rolls + previous_frame.rolls < 3
      previous_previous_frame.add_bonus(pinfall)
    end
  end

  def previous_frame
    @frames[@frames.length - 2] unless @frames.length < 2
  end

  def previous_previous_frame
    @frames[@frames.length - 3] unless @frames.length < 3
  end

  def current_frame
    @frames.last
  end

  def current_frame_over?
    if @frames.length == MAX_FRAMES
      current_frame.rolls == if current_frame.pinfall < FRAME_PINS
                               FRAME_ROLLS
                             else
                               3
                             end
    else
      current_frame.rolls == FRAME_ROLLS || current_frame.pinfall == FRAME_PINS
    end
  end

  def new_frame
    @frames << Frame.new
  end
end
