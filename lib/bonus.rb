require_relative 'frame'

class Bonus < Frame  
  
  def bonus?
    b = 0
    bowls.each do |bowl| b += bowl end 
    b == MAX_PINS || strike?
  end
  
  def bowl(hits)
    remaining = @pins - hits
    raise "Error, please enter a valid number of hits" if hits > MAX_PINS || (remaining < 0 && extra_bowls == 0)
    @pins = remaining unless bonus?
    bowls << hits
  end  

  def extra_bowls
    if strike?
      2
    elsif spare?
      1
    else
      0
    end
  end
  
  def finished?
    (bonus? && bowls.size == 3) || (bowls.size == 2 && !bonus?)
  end
end