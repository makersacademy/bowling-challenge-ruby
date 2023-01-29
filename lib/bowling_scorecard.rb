
class BowlingScorecard
  def initialize(rolls)
    @rolls = rolls
  end
  def set_frames
    @rolls.map{@rolls[0] == 10 ? @rolls << @rolls.shift(1) : @rolls << @rolls.shift(2)}
    return @rolls
  end
  def apply_bonuses
    @rolls.each_with_index do |frame, i|
      if frame.sum == 10 && frame.length == 1
        if @rolls[i+1].length == 2
          frame[0] += @rolls[i+1].sum
        elsif @rolls[i+1].length == 1
          frame[0] += @rolls[i+1] && frame[0] += [i+2][0]
        end
      end
    end
  end 
  def total
    return @rolls
  end 
  

end 
