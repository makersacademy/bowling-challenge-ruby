class Scorecard

  attr_reader :frame

  def initialize
    @frame = 1
  end

  def roll
    @frame += 0.5
  end
end