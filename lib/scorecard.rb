class Scorecard
  attr_reader :scorecard, :roll, :frame

  def initialize
    @scorecard = []
    @roll = 1
    @frame = 1
  end

  def add_score(score)
    if @roll == 1
      @scorecard << [score]
      @roll = 2
    else
      @scorecard[@frame - 1] << score
      next_frame
    end
  end

  private
  def next_frame
    @roll = 1
    @frame += 1
  end
end
