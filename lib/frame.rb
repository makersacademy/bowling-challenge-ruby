class Frame
  attr_reader :rolls, :final_score, :score

  def initialize(*args)
    @rolls = args
    @score = @rolls.sum
  end

  def is_strike?
    @rolls.first == 10 ? true : false
  end

  def is_spare?
    (!is_strike? && @rolls.sum == 10) ? true : false
  end

  def calculate_strike_bonus do
    
  end

  def calculate_spare_bonus do

  end

end
