class Game
  attr_reader :frames

  def initialize
    @frames = []
  end

  def frame(roll_1, roll_2)
    @frames << [roll_1, roll_2]
  end

end