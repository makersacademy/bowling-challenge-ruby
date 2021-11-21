# frozen_string_literal: true

# This class stores information for a specific frame
class Frame
  attr_reader :first_bowl, :second_bowl, :frame, :next_frame, :next_next_frame

  def initialize(frame, next_frame = nil, next_next_frame = nil)
    @first_bowl = frame.first
    @second_bowl = frame.last
    @frame = frame
    @next_frame = next_frame
    @next_next_frame = next_next_frame
  end

  def bonus_type
    return :no_bonus if @next_frame.nil? || @frame.sum < 10
    return :spare unless @frame.include?(10)
    
    :strike
  end

  def score
    case bonus_type
    when :no_bonus then @first_bowl + @second_bowl
    when :spare then calculate_spare
    when :strike then calculate_strike
    end
  end

  private

  def calculate_spare
    10 + @next_frame.first
  end

  def calculate_strike
    return 20 + @next_next_frame.first if next_frame_is_strike? && !@next_next_frame.nil?

    10 + @next_frame.sum
  end

  def next_frame_is_strike?
    @next_frame.include?(10)
  end
end
