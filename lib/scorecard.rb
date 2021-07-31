class Scorecard

  attr_reader :frame, :scorecard, :score

  def initialize
    @frame = 1
    @scorecard = {}
    @score = 0
  end

end