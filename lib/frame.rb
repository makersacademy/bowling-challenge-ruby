class Frame

  attr_accessor :rolls, :score, :bonus_score

  def initialize
    @rolls = []
    @score = 0
    @bonus_score = 0
  end

  def rolled(pins)
    @rolls << pins
  end

  def score
    @score = @rolls.sum
  end

  def next_turn?
    @rolls.length == 2 || strike?
  end

  def strike?
    @rolls[0] == 10
  end

  def spare?
    @rolls.sum == 10 && !strike?
  end

end

#NEXT NEED TO TEST TOTAL SCORE ON SCORECARD

# roll_1 = { pins => 6, bonus => nil}
# roll_2 = { :pins => 10, :strike => true, :spare => false }