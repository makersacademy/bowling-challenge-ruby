class BowlScore

  def initialize(rolls)
    fail "invalid roll" unless rolls_valid?(rolls)
    @game = Game.new(rolls)
  end

  def score
    bonus = 9.times.map do |ind| 
      (@game.frames[ind].spare_or_strike ? @game.next_roll(ind + 1) : 0) +
      (@game.frames[ind].strike ? @game.next_two(ind + 1) : 0)
    end
    @game.frames.map.sum { |frame| frame.score } + bonus.sum    
  end

  private

  def rolls_valid?(rolls)
    return false if rolls.length < 11 || rolls.length > 21
    return false if rolls.any? { |roll| roll > 10 || roll < 0 }
    true
  end
end