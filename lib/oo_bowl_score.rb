class BowlScore

  def initialize(rolls)
    fail "invalid roll" unless rolls_valid?(rolls)
    @game = Game.new(rolls)
  end

  def score
    
  end

  private

  def rolls_valid?(rolls)
    return false if rolls.length < 11 || rolls.length > 21
    return false if rolls.any? { |roll| roll > 10 || roll < 0 }
    true
  end
end