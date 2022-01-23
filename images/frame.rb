class Frame 
  attr_reader :roll_1, :roll_2
  def initialize(roll_1 = 0, roll_2 = 0)
    @roll_1 = roll_1
    @roll_2 = roll_2
  end

  def to_array
    [@roll_1, @roll_2]
  end

  def is_strike? 
    true if @roll_1 == 10 
  end

  def is_spare? 
    @roll_1 != 10 && (@roll_2 + @roll_1) == 10 
  end
end
# p f = Frame.new(10, 0)
# p f.roll_1
# p @roll_1
# p f.is_strike?