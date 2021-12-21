class Game
  attr_reader :frames

  def initialize
    @frames = []
  end

  def add_rolls(roll1, roll2)
    @frames << [roll1, roll2]
    raise 'Sum of the rolls cannot exceede 10' if [roll1, roll2].reduce(0, :+) > 10
  end
end