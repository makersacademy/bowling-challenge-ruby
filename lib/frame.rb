class Frame

  attr_reader :rolls

  def initialize
    @rolls = []
  end

  def store_first_roll(roll_1)
    @rolls << roll_1
  end

end