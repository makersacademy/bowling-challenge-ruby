class Frame
  attr_reader :rolls

  def initialize
    @rolls = []
  end

  def ended?
    made_two_moves? || strike?
  end

  def add(roll = Roll.new(pins))
    @rolls << roll
  end

  def score
    @rolls.map { |roll| roll.pins }.inject(:+)
  end

  def spare?
    strike? ? false : roll_points(1) + roll_points(2) == 10
  end

  def strike?
    no_moves_made? ? false : roll_points(1) == 10
  end

  def roll_points(turn)
    @rolls[turn - 1].pins
  end

  private

  def no_moves_made?
    @rolls.empty?
  end

  def made_two_moves?
    @rolls.length == 2
  end
end
