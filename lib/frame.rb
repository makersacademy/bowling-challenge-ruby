class Frame
  def initialize
    @score = 0
    @throw_one = 0
    @throw_two = 0
    @throw_three = 0
  end

  attr_reader :score, :throw_one, :throw_two, :throw_three

  def update_score(points)
    @score += points
  end

  def update_throw_one(pins_knocked)
    @throw_one += pins_knocked
  end

  def update_throw_two(pins_knocked)
    @throw_two += pins_knocked
  end

  # For tenth frame if a third throw is allowed
  def update_throw_three(pins_knocked)
    @throw_three += pins_knocked
  end
end
