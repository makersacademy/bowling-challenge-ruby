class Bowling
  
  def initialize()
    @score = 0
   
  end

  def total_score
    @score 
  end

  def hit(pin_count)
    @score += pin_count
  end

  def spare_frame
   @score << hit
  end
end