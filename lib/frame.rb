class Frame

  attr_reader :score, :pins, :roll, :strike, :spare

  def initialize
    @score = 0
    @pins = 10
    @roll = 1
    @strike = false
    @spare = false
  end

  def roll_ball(num)
    @pins -= num
    @score += num
  end

  def next_roll
    @roll += 1
  end

  def strike?
    @roll == 1 && @pins == 0
    
  end

  def spare?
    @roll == 2 && @pins == 0
  end
end