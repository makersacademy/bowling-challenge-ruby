
class Frames
  def initialize
    @rolls = rolls
  end
  
  def score
    result = 0
    rollindex = 0
    10.times do
      if strike? rollindex
        result += strikescore rollindex
        rollindex += 1
      elsif spare? rollindex
        result += sparescore rollindex
        rollindex += 2
      else
        result += framescore rollindex
        rollindex +=2
      end
    end
    result
  end

  def strike? rollindex
    @rolls[rollindex] == 10
  end

  def spare? rollindex
    @rolls[rollindex] + @rolls[rollindex + 1] == 10
  end


end