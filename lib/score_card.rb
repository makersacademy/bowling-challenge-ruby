require_relative 'frame'

class Scorecard
  attr_accessor :frames

  def initialize
   @frames = []
  end

  def add_frame(frame)
    @frames << frame
  end

  def calculate_current_score
    
    rolling_score = 0
    second_last_frame = nil
    last_frame = nil
    @frames.each { |frame| 
      rolling_score += frame.roll_1
      rolling_score += frame.roll_2 if frame.roll_2 != nil 
      rolling_score += frame.roll_1 if (last_frame != nil && last_frame.spare?)
      rolling_score += frame.roll_1 + frame.roll_2 if (last_frame != nil && last_frame.strike? && frame.roll_2 != nil)
      rolling_score += frame.roll_1 + last_frame.roll_1 if (last_frame != nil && second_last_frame != nil && last_frame.strike? && second_last_frame.strike?)
      rolling_score += frame.roll_3 if frame.tenth_frame && frame.roll_3 != nil
      second_last_frame = last_frame
      last_frame = frame
    }
    return rolling_score
  end
end
