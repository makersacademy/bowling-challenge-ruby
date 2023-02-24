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

end