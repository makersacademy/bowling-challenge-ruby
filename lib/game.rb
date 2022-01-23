require './lib/frame'

class Game

  attr_reader :frames

  def initialize(frames = [])
    @frames = frames
  end

  def total_score
    @frames.sum { |frame| frame.score }
  end

  def add_frame(frame)
    analyse_frame(frame)
    @frames << frame
    p total_score
  end

  private
  def analyse_frame(analysed_frame)
    @frames.each do |frame| 
      if analysed_frame.strike? 
        if frame.bonus_rolls > 0
          frame.score += analysed_frame.roll_1
          frame.bonus_rolls -= 1
        end
      else
        if frame.bonus_rolls == 2
          frame.score += analysed_frame.roll_1 + analysed_frame.roll_2
          frame.bonus_rolls -= 2
        elsif frame.bonus_rolls == 1
          frame.score += analysed_frame.roll_1
          frame.bonus_rolls -= 1
        end
      end
    end
  end
end