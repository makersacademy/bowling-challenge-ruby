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

  def completed?
    if number < 10
      rolls.length == 2 || rolls[0] == 10
    elsif rolls[0, 2].sum < 10
      rolls.length == 2
    else
      rolls.length == 3
    end
  end

end
