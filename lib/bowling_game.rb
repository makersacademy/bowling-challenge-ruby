class BowlingGame

TOTAL_PINS = 10

  def initialize
    @score_card = []
  end

  def roll(pins)
    fail "Invalid score, please try again." if pins > TOTAL_PINS
    @score_card << pins
  end

  def score
    @score_card.sum
  end

end
