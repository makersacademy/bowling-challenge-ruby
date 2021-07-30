class Scorecard

  attr_reader :frame, :score

  def initialize
    @frame = 1
    @score = 0
  end

  def roll(score)
    @frame += 0.5
    @score =+ score
  end
end