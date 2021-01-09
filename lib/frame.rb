class Frame
  attr_reader :roll_1, :roll_2
  attr_accessor :frame_score

  def initialize(roll_1, roll_2 = 0)
    @roll_1 = roll_1
    @roll_2 = roll_2
    @frame_score = @roll_1 + @roll_2
  end
end
