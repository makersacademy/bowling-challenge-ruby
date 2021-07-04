class Frame
  attr_reader :pins, :roll_1, :roll_2

  def initialize(roll_1 = Roll.new, roll_2 = Roll.new)
    @pins = 10
    @roll_1 = roll_1
    @roll_2 = roll_2
  end
end
