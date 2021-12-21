class Game
  attr_reader :frames

  def initialize
    @frames = []
  end

  def add_rolls(roll1, roll2)
    @frames << [roll1, roll2]
  end
end