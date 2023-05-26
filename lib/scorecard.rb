# frozen_string_literal: true

require_relative 'frame'

class ScoreCard
  def initialize
    @frame_count = 10
    @all_frames = []
    @final_frames = []
    @tenth_frame = false
    @total = nil
  end

  def frame_input(frame)
    @frame_count -= 1
    if @all_frames.empty?
      @all_frames << frame
      calculate_total
    elsif @all_frames.last.strike? == true
      strike_bonus_rolls(frame)
    elsif @all_frames.last.spare? == true
      spare_bonus_roll(frame)
    else
      @all_frames << frame
      calculate_total
    end
  end

  def calculate_total
    @final_frames = final_arr_mapping
    @total = @final_frames.compact.flatten.reduce(:+)
    return tenth_frame if @frame_count == 0 && @tenth_frame == false
    "Current Total: #{@total} - #{@frame_count} frames left\n#{@final_frames}"
  end

  def tenth_frame
    @tenth_frame = true
    if @all_frames.last.strike? == true
      'strike tenth frame bonus roll functionality needed'
    elsif @all_frames.last.spare? == true
      'spare tenth frame bonus roll functionality needed'
    else
      final_format
    end
  end

  def final_format
    return "Your game isn't over yet! You have #{@frame_count} frames left" if @frame_count.positive?
    @final_frames = final_arr_mapping
    @total = @final_frames.compact.flatten.reduce(:+)
    return "Final Total: #{@total} - Frames:\n#{@final_frames}"
  end

  private

  def spare_bonus_roll(frame)
    @all_frames.delete_at(@all_frames.length - 1)
    total = frame.final.first + 10
    spare_bonus = [total, 0]
    @all_frames << spare_bonus
    @all_frames << frame
    calculate_total
  end

  def strike_bonus_rolls(frame)
    @all_frames.delete_at(@all_frames.length - 1)
    total = frame.final.sum + 10
    strike_bonus = [total, 0]
    @all_frames << strike_bonus
    @all_frames << frame
    calculate_total
  end

  def final_arr_mapping
    result = @all_frames.map do |frame|
      if frame.is_a?(Array)
        frame
      else
        frame.final
      end
    end

    return result
  end

end
