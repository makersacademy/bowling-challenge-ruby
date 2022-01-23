class Frame 
  attr_reader :roll_1, :roll_2
  def initialize(roll_1 = 0, roll_2 = 0)
    @roll_1 = roll_1
    @roll_2 = roll_2
  end

  def to_array
    [@roll_1, @roll_2]
  end

  def

end

p f = Frame.new(2,3)
p f.to_array