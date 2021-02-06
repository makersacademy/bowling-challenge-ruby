class Frame

  attr_reader :rolls

  @@frame_number = 0

  def initialize
    @@frame_number += 1
    @rolls = []
  end

  def number
    @@frame_number
  end

  def add_roll(pins)
    rolls << pins
  end

end
