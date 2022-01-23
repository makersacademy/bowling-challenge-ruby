class BowlingGame
  attr_reader :score_card

  def initialize(score_card = [])
    @score_card = score_card    
  end

  def roll(num)
    @score_card.push(num)       
  end
end
