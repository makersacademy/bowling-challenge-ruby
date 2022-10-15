class Bowling
  def initialize
    @score_card = []
  end

  def frame
    @score_card.length + 1 
  end

  attr_accessor :score_card
  
  def score

  end

  def add_score(first, second)
    @score_card << [first, second]
  end

  private

  def check_strike(arr)
    arr[0] == 10
  end
end

bowling = Bowling.new

puts bowling.frame