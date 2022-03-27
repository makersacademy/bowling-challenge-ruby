class Frame
  
  attr_reader :roll_array

  def initialize
    @roll_array = []
  end
  
  def flatten_frame

  end

  def total
    @roll_array.sum
  end

  def roll(pins)
    @roll_array << pins
  end

  def complete?
    if roll_array.sum == 10 || roll_array.length == 2
      true
    else
      false
    end
  end

end