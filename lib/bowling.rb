class Bowling
  def initialize
    @score_card = []
    @bonus_score = 0
  end

  attr_accessor :score_card, :bonus_score

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
    @bonus_score = 0
    iterator = 0 
    while iterator < @score_card.length - 1 do # minus 1 because last frame offers no bonus
      if check_strike(@score_card[iterator])
        # strikes need to add the score of the next frame to the current frame
        # simulated by adding the next frame as bonus score
        if check_strike(@score_card[iterator + 1])
          @bonus_score += 10 + @score_card[iterator + 2][0]
        else
          @bonus_score += @score_card[iterator + 1].sum
        end
      elsif check_spare(@score_card[iterator])
        @bonus_score += @score_card[iterator + 1][0]
        # If you get a spare then it basically doubles the score of the next roll
      end
      iterator += 1
    end

    @bonus_score
  end

  def total_score
    self.score + self.bonus_score
  end
end