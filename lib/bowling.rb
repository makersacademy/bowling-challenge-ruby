class Bowling
  attr_accessor :total 
  
  def initialize
    @total = 0 
  end

  def play(move)
    move.to_i
    @total += move
  end
end
