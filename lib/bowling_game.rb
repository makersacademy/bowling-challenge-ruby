class BowlingGame

  def initialize
    @score_card = []
  end

  def roll(pins)
   @total_pins = 10
   @score_card << pins
  end

  def score
    @score_card.sum
  end

end
