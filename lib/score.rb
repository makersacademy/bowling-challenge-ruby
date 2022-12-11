require_relative './frame'

class Score 

  def initialize(frames)
    @frames = frames
  end 

  def total_score
    sum_score + bonus_score
  end

  private

  def bonus_score
    bonus_score = 0
    @frames.each_with_index do |frame, index|
      if frame.first_roll == 10 
        bonus_score =+ @frames[index+1].frame_score
      elsif frame.first_roll + frame.second_roll == 10
        bonus_score =+ @frames[index+1].first_roll
      end
    end
    bonus_score
  end 

  def sum_score
    @frames.sum { |frame| frame.frame_score }
  end 
end 