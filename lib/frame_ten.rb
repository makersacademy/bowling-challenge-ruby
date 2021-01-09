class FrameTen < Frame
  attr_reader :roll_3

  def initialize(roll_1, roll_2, roll_3 = 0)
    @roll_3 = roll_3
    super(roll_1, roll_2)
  end
end
