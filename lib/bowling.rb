class Bowling
  def initialize
    @rolls = []
  end
  
  def roll(points)
    @rolls << points
  end 

  def total_score
    @rolls.sum
  end 


end
