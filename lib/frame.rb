class Frame

  attr_accessor :bonus_throws
  attr_reader :score

  def initialize(throw_1, throw_2 = nil)
    @throw_1 = throw_1
    @throw_2 = throw_2
    @score = determine_score
    @bonus_throws = bonus_throws?
  end
  
  def add_points(points)
    @score += points
  end
  
  private
  def bonus_throws?
    strike? ? 2 : spare? ? 1 : 0
  end

  def determine_score
    strike? ? @throw_1 : @throw_1 + @throw_2
  end

  def strike?
    @throw_2.nil?
  end

  def spare?
    strike? ? false : @throw_1 + @throw_2 == 10
  end
end
