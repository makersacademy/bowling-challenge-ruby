
require_relative 'frame'
class Game

  attr_reader :completed_frames, :current_frame

  def initialize
    @completed_frames = []
    @current_frame = Frame.new
  end

  def check_current_frame
    if @current_frame.rolls == 2 || @current_frame.strike? || @completed_frames.length >=10
      @completed_frames << @current_frame.contents
      @current_frame = Frame.new
    end
    @current_frame.contents
  end

  def record_roll(roll)
    @current_frame.record_roll(roll)
    check_current_frame
  end

  def calculate_score
    bonus_roll_correction(apply_bonuses).flatten.sum
  end

  def apply_bonuses(frames = @completed_frames)
    apply_bonuses = frames.each_with_index do |frame, index|
      if spare?(frame) && (frames[index+1])
        frame[-1] += frames[index+1][0]
      elsif strike?(frame) && (frames[index+1]) && (frames[index+1].length == 2)
        frame[-1] += (frames[index+1][0] + frames[index+1][1])
      elsif strike?(frame) && (frames[index+1]) && (frames[index+2])
        frame[-1] += (frames[index+1][0] + frames[index+2][0])
      end
    end
    apply_bonuses
  end

  def spare?(frame)
    if (frame.sum == 10) && (frame.length == 2)
      true
    else
      false
    end
  end

  def strike?(frame)
    if (frame.sum == 10) && (frame.length == 1)
      true
    else
      false
    end
  end

  def bonus_roll_correction(array)
    result = array.delete_if.with_index { |num, idx| idx > 9 }
    result
  end

end
