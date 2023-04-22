class Scorecard
  def initialize 
    @total_score = 0
    @frame = 1
  end

  def add_score(roll_one, roll_two, roll_three = 0)
    if @frame <= 10
      if @frame < 10
        strike_or_spare
        #@total_score += roll_one + roll_two
      else
        if @frame == 10 && (roll_one == 10 || roll_one + roll_two == 10)
          @total_score += roll_one + roll_two + roll_three
        elsif @frame == 10 && (roll_one != 10 || roll_one + roll_two != 10)
          @total_score += roll_one + roll_two
        end
      end
      @frame += 1
    end
  end

  def strike_or_spare
    if @frame < 10
      if roll_one == 10 # strike
        @total_score += (roll_one + roll_two) + (@frame += 1)(roll_one + roll_two)
      elsif roll_one + roll_two == 10 # spare
        @total_score += (roll_one + roll_two) + (@frame += 1)(roll_one)
      end
    end
  end
  
  def total_score
    if @total_score == 0
      return "Gutter Ball!"
    elsif
      @total_score == 300
      return "Perfect Score!"
    else
      return @total_score
    end
  end
end
