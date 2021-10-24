require_relative 'frame'

class BonusFrame < Frame  
  
  def bonus?
    bowls.take(2).reduce(:+) == MAX_PINS || strike?
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

  def bowl(hits)
    remaining = remaining_pins - hits
    raise ArgumentError.new("Invalid number of pins") if (remaining < 0 && extra_bowls == 0) || pins > MAX_PINS
    @remaining_pins = remaining unless bonus?
    bowls << pins
  end  

  def finished?
    (bowls.size == 2 && !bonus?) || (bonus? && bowls.size == 3)
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