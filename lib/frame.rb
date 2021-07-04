class Frame
  attr_reader :pins, :rolls

  def initialize()
    @pins = 10
    @rolls = []
    @turns_left = 2
  end

  def ended?
    false
  end

  def add(roll = Roll.new(pins))
    @rolls << roll
    @pins -= roll.pins
    @turns_left -= 1
  end

  def score
    @rolls.map {|roll| roll.pins }.inject(:+)
  end
end
