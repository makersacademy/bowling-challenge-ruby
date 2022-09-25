require_relative './frame.rb'

class Game
  def initialize 
    @all_frames = []
  end
  
  def add_frame(frame)
    @all_frames << frame
  end

  def all_frames
    @all_frames
  end

  def sum
    n = 0
    sum = 0

    @all_frames.each do |frame|
      if @all_frames[n-1].spare? && n != 0
        sum += frame.roll_1 * 2 + frame.roll_2
      else
        sum += frame.roll_1 + frame.roll_2
      end
      n += 1
    end
    sum
  end
end