class Scorecard
  attr_reader :player, :running_score, :bowl_total, :bowl_card, :score_card

  def initialize(running_score = 0, player = 'Lilly')
    @player = player
    @running_score = running_score
    @bowl_card = []
    @score_card = []
  end

  def bowl(first_bowl, second_bowl = 0)
    frame = [first_bowl, second_bowl]
    @bowl_card << frame
    score
    bowl_total = first_bowl + second_bowl
  end

  def roll_total
    @bowl_card[-1].sum
  end

  def spare?
    roll_total == 10 ? true : false
  end

  def strike?
    @bowl_card[-1][0] == 10 ? true : false
  end
  
  def score
    @score_card << roll_total unless spare? || strike?
    @running_score += roll_total
  end

end