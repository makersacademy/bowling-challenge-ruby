class Frame
  attr_reader :pins, :rolls

  def initialize
    @pins = 10
    @rolls = []
    @ended = false
  end

  def ended?
    if @rolls.length == 2
      @ended = true
    else
      @ended
    end
  end

  def add(roll = Roll.new(pins))
    @rolls << roll
    @pins -= roll.pins
  end

  def score
    @rolls.map { |roll| roll.pins }.inject(:+)
  end
end
