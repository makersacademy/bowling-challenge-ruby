class Player 
  # needs to keep track of their own score 
  # needs to track any streaks of strikes in their score ????

attr_reader :name, :score

  def initialize(name, score = Array.new)
    @name = name
    @score = score
  end

  def frame
    fail "Game is complete no frames remaining" if @score.length == 10
    first_bowl = rand(0..10)
    # case strike
    return @score << ["X", "-"] if first_bowl == 10
    remaining_pins = 10 - first_bowl
    second_bowl = rand(0..remaining_pins)
    return @score << [first_bowl, "/"] if (first_bowl + second_bowl) == 10 
    @score << [first_bowl, second_bowl]
  end

end