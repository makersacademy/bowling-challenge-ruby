class Scorecard

  attr_reader :roll, :frame, :total_score, :first_roll

  def initialize
    @roll = 1
    @frame = 1
    @total_score = 0
    @first_roll = 0
  end

  def roll_ball(pins)
    if roll == 1
      @first_roll += pins
      @roll + 1
    else roll == 2
      @total_score += (first_roll + pins)
    end
    puts @total_score
    @roll = 1
    @first_roll = 0
  end
end
