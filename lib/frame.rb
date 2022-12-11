class Frame
  def initialize
    @score = 0
    @rolls = 0
  end

  def add_roll(roll)
    raise "Only two rolls can be made per frame" if @rolls >= 2
    raise ArgumentError.new "A roll must be an integer" unless integer_roll?(roll)
    raise ArgumentError.new "A roll must be between 0 and 10" if roll < 0 || roll > 10
    raise "Both rolls cannot add up to more than 10" if @score + roll > 10
    
    @score += roll.to_i
    @rolls += 1
  end

  def score
    return @score
  end

  private

  def integer_roll?(roll)
    return roll.is_a?(Integer) || roll % 1 == 0.0
  end
end
