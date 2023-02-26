class Frame
  attr_reader :rolls

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

  def frame_complete?(index)
    if index < 9
      return strike? || @rolls.length == 2
    else
      return false if @rolls.length < 2
      if @rolls[0] == 10 || (@rolls[0] + @rolls[1]) == 10
        return @rolls.length == 3
      else
        return @rolls.length == 2
      end
    end
  end 

end