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

      # The calculations are done for the first 10 frames + the bonus rolls 
      # (that are saved as separate frames, but we only calculate them as a part of the 10th roll)
      if n < 10

        # First we need to check if the roll is a strike
        if frame.strike? 

          # If yes, we need to check if the following roll is also a strike
          if @all_frames[n+1].strike?
            sum += frame.total + @all_frames[n+1].total + @all_frames[n+2].roll_1
          else
            sum += frame.total + @all_frames[n+1].total
          end

        # Then we need to check if the frame is a spare
        elsif frame.spare?
          sum += frame.total + @all_frames[n+1].roll_1

        # If the frame is neither a strike, nor a spare, the total for this frame is a sum of its rolls
        else
          sum += frame.total
        end
      end

      n += 1
    end

    return sum
  end
end
    