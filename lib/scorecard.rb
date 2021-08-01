
class Scorecard
  attr_reader :score, :frame, :roll_count

  def initialize 
    @score = 0
    @roll_count = 0
  end

  def roll_input(roll_score)
    if @roll_count == 0
      @frame = {roll1: roll_score}
      @roll_count += 1
    elsif @roll_count == 1
      @frame[:roll2] = roll_score
      @roll_count = 0
    end
    @score += roll_score
  end


end