class Bowling
  def initialize
    @score_card = []
  end

  attr_accessor :score_card

  def frame
    if @score_card.length >= 9 then return 10 end

    @score_card.length + 1 
  end

  def score
    # Squishes the array and sums up the score
    @score_card.flatten.inject(:+)
  end

  def add_score(first = 0, second = 0)
    if @score_card.length == 10 && @score_card.last.sum == 10
      @score_card.last.push(first)
    elsif @score_card.length == 10
      puts 'Game Over'
    else
    @score_card << [first, second]
    end
  end

  def check_strike(arr)
    arr[0] == 10
  end
end