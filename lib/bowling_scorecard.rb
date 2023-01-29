
class BowlingScorecard
  def initialize(rolls)
    @rolls = rolls
  end
  def set_frames
    @rolls.map {
      @rolls[0] == 10 ?
      @rolls << @rolls.shift(1) : 
      @rolls << @rolls.shift(2)
    }
  end

end 