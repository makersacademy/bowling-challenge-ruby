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

end