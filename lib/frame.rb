class Frame

  attr_reader :rolls

  def initialize
    @rolls = []
  end

  def store_first_roll(roll_1)
    @rolls << roll_1
  end

  def store_second_roll(roll_2)
    @rolls << roll_2
  end

end
