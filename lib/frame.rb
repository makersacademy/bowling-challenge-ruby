class Frame
  attr_accessor :rolls, :bonus_rolls, :bonus_points

  def initialize
    @rolls = []
    @bonus_rolls = 0
    @bonus_points = 0
  end
end
