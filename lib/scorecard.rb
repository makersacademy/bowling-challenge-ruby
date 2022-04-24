# frozen_string_literal: true

class Scorecard
  attr_reader :frames, :next_frame

  def initialize(frames)
    @frames = frames
  end

  def final_score
    final_score = 0
    @frames.each_with_index do |frame, index|
      final_score += frame.sum
      final_score += strike_bonuses(frame, index)
      final_score += spare_bonuses(frame, index)
    end
    final_score
  end

  def strike_bonuses(frame, index)
    return 0 unless strike?(frame)
    return 0 if index == 9

    @next_frame = @frames[index + 1]
    @final_frame = @frames[9]
    next_frame = @next_frame

    if strike?(next_frame)
      @next_frame[0] + @final_frame[0]
    else
      @next_frame.sum
    end
  end

  def strike?(frame)
    frame.include?(10)
  end

  def spare_bonuses(frame, index)
    return 0 unless spare?(frame)
    return 0 if index == 9

    @next_frame = @frames[index + 1][0]
    @next_frame
  end

  def spare?(frame)
    frame[0] + frame[1] == 10 if frame.length > 1
  end
end
