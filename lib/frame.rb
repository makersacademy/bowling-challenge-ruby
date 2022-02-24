class Frame

  attr_reader :rolls, :number
  attr_accessor :score

  def initialize(number = 0)
    @score = nil
    @rolls = []
    @number = number
  end
  
  def record_roll(roll)

    raise 'Invalid Roll' if !rolls.empty? && roll + rolls.first > 10

    if rolls.empty? && roll == 10
      @rolls << 'X' 
    elsif rolls.first && rolls.first + roll == 10 
      @rolls << '/' if rolls.first && rolls.first + roll == 10  
    else
      @rolls << roll
    end

  end

end