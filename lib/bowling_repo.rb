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
        @total_score += roll_one + roll_two + roll_three
      end
      @frame += 1
    end
  end

  def total_score
    @total_score
  end
end
