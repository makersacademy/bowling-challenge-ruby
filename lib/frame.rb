class Frame
  attr_accessor :frame, :pins, :roll1, :roll2, :roll3, :bonus, :score

  def initialize(frame)
    @frame = frame
    @pins = 10
    @roll1 = 0
    @roll2 = 0
    @roll3 = 0
    @bonus = 0
    @score = 0
  end

  def calc_score
    return @score = @roll1 + @roll2 + @roll3 + @bonus
  end
end
