class Scorecard
  def initialize 
    @frames = [Frame.new]
    @current_frame = 1
    @total_score = 0
  end

  def add_roll(pins)
    current_frame.add_roll(pins)

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
