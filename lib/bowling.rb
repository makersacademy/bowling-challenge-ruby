class Bowling

  attr_reader :total_score, :frame

  def initialize
    @frame = 1
    @total_score = 0
  end

  def enter_score(score)
    @frame += 1
    @total_score += score
  end

end