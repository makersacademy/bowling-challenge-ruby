class Bowling

  attr_reader :frames

  def initialize
    @frames = []
  end

  def roll(pins_hit)
    @previous_bowl = pins_hit
    @frames << pins_hit
  end

  def is_strike?(pins_hit)
    pins_hit == 10 ? true : false
  end

  def is_spare?(pins_hit)
    @previous_bowl + pins_hit == 10 ? true : false
  end
end