
class Scorecard
  attr_reader :score

  def initialize 
    @score = 0
  end

  def roll_input(roll_score)
    @score += roll_score
  end


end