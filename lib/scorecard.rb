require 'spare'
require 'strike'

class Scorecard

  attr_reader :frame, :roll, :spares, :strikes, :score

  def initialize
    @frame = 1
    @roll = 1
    @spares = []
    @strikes = []
    @score = 0
  end

  def next_frame
    @frame += 1 unless frame == 10
  end

  def next_roll
    if frame == 10
      @roll += 1 unless roll >= 3
    else
      @roll += 1 unless roll >= 2
    end
  end

  def add_spare(spare = Spare.new)
    @spares << spare
  end

  def add_strike(strike = Strike.new)
    @strikes << strike
  end

  def add_spare_score
    @score += spares.shift.score
  end

  def add_strike_score
    @score += strikes.shift.score
  end

end
