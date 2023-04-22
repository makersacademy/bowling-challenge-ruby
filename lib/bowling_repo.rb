class Scorecard
  def initialize 
    @total_score = 0
    @frame = 1
  end

  def add_score(roll_one, roll_two, roll_three = 0)
    if @frame <= 10
      if @frame < 10
        @total_score += roll_one + roll_two
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
  
  def total_score
    @total_score
  end
end
