class Frame

  attr_reader :total, :roll_1, :roll_2

  def initialize(roll_1:, roll_2: 0)
    @roll_1 = roll_1
    @roll_2 = roll_2
    @total = calculate()
    return @total
  end

  def calculate
    return @roll_1 + @roll_2
  end


end
