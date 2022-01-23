class Frame

  attr_accessor :bonus_rolls, :score
  attr_reader :roll_1, :roll_2

  def initialize(roll_1, roll_2 = nil)
    @roll_1 = roll_1
    @roll_2 = roll_2
    @score = count_pins
    @bonus_rolls = bonus_rolls?
  end
  
  def add_points(points)
    @score += points
  end
  
  def strike?
    @roll_2.nil?
  end

  def spare?
    strike? ? false : @roll_1 + @roll_2 == 10
  end

  private

  def count_pins
    strike? ? @roll_1 : @roll_1 + @roll_2
  end

  def bonus_rolls?
    strike? ? 2 : spare? ? 1 : nil
  end
end
