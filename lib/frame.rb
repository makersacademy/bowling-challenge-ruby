class Frame
  def initialize(roll_1, roll_2)
    @roll_1 = roll_1
    @roll_2 = roll_2
  end

  attr_reader :roll_1, :roll_2
end