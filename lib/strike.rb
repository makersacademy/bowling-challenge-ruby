class Strike

  attr_reader :score

  def initialize
    @score = 10
    @roll_count = 0
  end

  def add(points)
    fail 'Strike can only add 10 more points per roll' unless points <= 10
    fail 'Strike only counts 2 next rolls for bonus points' unless @roll_count < 2
    @score += points
    @roll_count += 1
  end

  def complete?
    @roll_count == 2
  end

end
