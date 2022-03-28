class Frame
  
  attr_reader :rolls

  def initialize
    @rolls = []
  end
  
  def flatten_frame

  end

  def total
    @rolls.sum
  end

  def roll(pins)
    @rolls << pins
  end

  def complete?
    if total == 10 || rolls.length == 2
      true
    else
      false
    end
  end
  
  def strike?
    if total == 10 && rolls.length == 1
      true
    end
  end

  def spare?
    if total == 10 && rolls.length == 2
      true
    end
  end

end