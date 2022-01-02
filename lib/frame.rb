class Frame
  attr_reader :score
  attr_accessor :roll_1, :roll_2

  def initialize
    @score 
    @roll_1 = 0
    @roll_2 = 0
  end

  def score
    @roll_1 + @roll_2
  end

  def set_roll_1(pins)
    @roll_1 = pins
  end

  def set_roll_2(pins)
    @roll_2 = pins
  end
end