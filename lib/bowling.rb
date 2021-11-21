class Bowling

  attr_reader :frames

  def initialize
    @frames = []
  end

  def roll(pins_hit)
    @frames << pins_hit
  end
end