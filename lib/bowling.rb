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

  def check_spare(arr)
    arr[0] + arr[1] == 10 && arr[0] != 10
  end

  def bonus_score
    bonus_score = 0
    iterator = 0 
    while iterator < @score_card.length do
      if check_strike(@score_card[iterator])
        # strikes need to add the score of the next two frames to the current frame
        # To simulate, the next two frames get doubled score in the form of
        # bonus score.
        bonus_score += @score_card[iterator + 1].sum
        bonus_score += @score_card[iterator + 2].sum
      elsif check_spare(@score_card[iterator])
        bonus_score += @score_card[iterator + 1].sum
      end
      iterator == 1
    end
    bonus_score
  end
end