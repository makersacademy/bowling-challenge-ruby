require './lib/frame.rb'

class Game
  def initialize 
    @frames = []
    @score = 0
  end 

  def add_frame(frame)
    @frames << frame
  end 
  
  def total_score
    frameindex = 0

    while frameindex  < frames.length do
      #strike
      if @frames[frameindex][0] == 10
        if @frames[frameindex+1][0] == 10
          @score += @frames[frameindex][0] + @frames[frameindex+1][0] + @frames[frameindex+2][0]
        else
          @score += @frames[frameindex][0] + @frames[frameindex+1][0] + @frames[frameindex+1][1]
        end
      elsif @frames[frameindex][0] + @frames[frameindex][1] == 10
        @score += @frames[frameindex][0] + @frames[frameindex][1] + @frames[frameindex+1][0]
      else
        @score += @frames[frameindex][0] + @frames[frameindex][1]
      end
      frameindex += 1
    end
    @score
  end

  attr_accessor :frames

end
