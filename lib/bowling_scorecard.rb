
class BowlingScorecard
  def initialize(rolls)
    @rolls = rolls
  end
  def set_frames
    @rolls.map{@rolls[0] == 10 ? @rolls << @rolls.shift(1) : @rolls << @rolls.shift(2)}
    return @rolls
  end
  def apply_bonuses
    @rolls.first(9).each_with_index do |frame, i|
      if frame.sum == 10 && frame.length == 1 # strike
       if frame && @rolls[i+1] && @rolls[i+2]
        if @rolls[i+1].length == 2            # next two rolls in same frame
          frame[0] += @rolls[i+1].sum         
        elsif @rolls[i+1].length == 1 && @rolls[i+2].length == 1   # next roll also a strike
          frame[0] += 20
        end
       end
      elsif frame.sum == 10 && frame.length == 2 # spare
        frame[0] += @rolls[i+1][0]              
      else 
        frame
      end
      
    end
  end 

  def sub_total
    return @rolls
  end 
  
  def total
    return @rolls.flatten.inject(:+)
  end


end 
