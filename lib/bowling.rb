class Bowling
  def initialize
    @score_card = []
  end

  attr_accessor :score_card

  def frame
    @score_card.length + 1 
  end

  def score
    # Squishes the array and sums up the score
    @score_card.flatten.inject(:+)
  end

  def add_score(first = 0, second = 0)
    @score_card << [first, second]
  end

  def check_strike(arr)
    arr[0] == 10
  end
end

bowling = Bowling.new

puts bowling.frame