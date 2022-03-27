class Frame

  attr_accessor :rolls, :score

  def initialize
    @rolls = []
  end

  def rolled(pins)
    @rolls << pins
  end

  def score
    @score = @rolls.sum
  end

  def next_turn?
    @rolls.length == 2 || previous_was_strike?
  end

  def previous_was_strike?
    @rolls[0] == 10
  end

end

#NEXT NEED TO TEST TOTAL SCORE ON SCORECARD

# roll_1 = { pins => 6, bonus => nil}
# roll_2 = { :pins => 10, :strike => true, :spare => false }