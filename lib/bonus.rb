require_relative 'frame'

class BonusFrame < Frame  
  
  def bonus?
    bowls.take(2).reduce(:+) == MAX_PINS || strike?
  end
  
  def bowl(hits)
    remaining = @pins - hits
    raise "Error, please enter a valid number of hits" if hits > MAX_PINS || (remaining_pins < 0 && extra_bowls == 0)
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
  
  def to_s
    remaining_bowls = bowls.dup
    bowl_string = ""
    frame = Frame.new
    until remaining_bowls.empty?
      frame.bowl(remaining_bowls.shift)
      if frame.finished?
        bowl_string << frame.to_s
        frame = Frame.new
      end
    end
    bowl_string << frame.to_s unless frame.finished?
    bowl_string
  end
end