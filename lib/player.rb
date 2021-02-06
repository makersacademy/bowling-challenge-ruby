class Player

  attr_reader :scores

  def initialize
    @scores = Array.new
  end

  def frame(roll_1, roll_2)
    @scores.push([roll_1, roll_2])
  end

end
