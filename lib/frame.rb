class Frame
  def initialize
    @final = []
  end
  
  def result(first_roll, second_roll)
    if first_roll == 10
      @final << first_roll 
      @final << 0
      return @final
    else
      @final << first_roll 
      @final << second_roll
      return @final
    end
  end
  
  def strike?
    @final.first == 10
  end
  
  def spare?
    !strike? && @final.sum == 10
  end
  
  def final
    return @final
  end
end