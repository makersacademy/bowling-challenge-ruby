class Spare

  attr_reader :score

  def initialize
    @score = 10
    @roll_count = 0
  end

  def add(points)
    fail 'Spare can only add 10 more points' unless points <= 10
    fail 'Spare only counts next roll for bonus points' unless @roll_count < 1
    @score += points
    @roll_count += 1
  end

  def complete?
    @roll_count == 1
  end

end
