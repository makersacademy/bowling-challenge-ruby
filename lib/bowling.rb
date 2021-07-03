class Bowling
  attr_reader :rolls

  def initialize
    @rolls = []
  end

  def frame(roll_one, roll_two)
    @rolls << {first: roll_one, second: roll_two}
  end
end