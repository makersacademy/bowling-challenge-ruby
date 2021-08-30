class Frame

  attr_reader :rolls

  def initialize
    @rolls = []
  end

  def store_roll_score(roll_score)
    raise "Enter a score between 0-10" if roll_score.class != Integer || !roll_score.between?(0, 10)

    @rolls << roll_score
  end

end
