class Frame

  def initialize
    @rolls = []
  end  

  def add_roll(pins)
    @rolls << pins
  end  

  def score
    @rolls.reduce(:+)
  end  

  def spare?
    @rolls.length == 2 && score == 10
  end  

  def strike?
    @rolls.length == 1 && @rolls.first == 10
  end 

  def frame_complete?
    strike? || @rolls.length == 2
  end  

end