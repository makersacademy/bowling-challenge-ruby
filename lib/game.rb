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
      if n < 9
        
        if frame.strike? 
          if @all_frames[n+1].strike?
            sum += 20 + @all_frames[n+2].roll_1
          else
            sum += frame.total + frame[n+1].total
          end
        elsif frame.spare?
          sum += frame.total + @all_frames[n+1].roll_1
        else
          sum += frame.total
        end

      elsif n = 9

      end
    end
    sum
  end
end