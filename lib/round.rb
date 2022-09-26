class Round
  attr_accessor :id, :roll1, :roll2, :roll3, :bonus, :score

  def initialize(id)
    @id = id
    @roll1, @roll2, @bonus = 0, 0, 0
    @roll3 = "/"
  end

  def calculate_score
    return @score = @roll1 + @roll2.to_i + @roll3.to_i + @bonus
  end
end