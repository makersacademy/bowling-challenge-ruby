require_relative './frame'

class Game
  attr_reader :frames

  def initialize
    @frames = [] 
    10.times do
      @frames.push(Frame.new)
    end
    @framecount = 0
  end  

  def roll(pins)
    current_frame = @frames[@framecount]
    if @framecount < 9
      current_frame.add_roll(pins)
      if current_frame.frame_complete?(@framecount)
        @framecount += 1
      end 
    else
      if !current_frame.frame_complete?(@framecount)
        current_frame.add_roll(pins)
      end
    end
  end  

  def total_score
    totalscore = 0
    @frames.each_with_index do |frame, index|
      if index < 9 
        if frame.strike?
          totalscore += frame.score + @frames[index + 1].rolls[0] + @frames[index + 1].rolls[1] 
        elsif frame.spare?
          totalscore += frame.score + @frames[index + 1].rolls[0] 
        else 
          totalscore += frame.score
        end
      else
        totalscore += frame.score
      end
    end
    return totalscore
  end     
  
end  
