class BowlingScoring

  def initialize
    @scorecard = []
    @score = []
  end

  def calculate(frames)
    rounds = frames.length
    frame = 0

    while rounds > 0 do
      @scorecard << frames[frame]
      if frame > 0 && frames[frame - 1].first == 10
        @scorecard << frames[frame]
      elsif frame > 0 && frames[frame - 1].sum == 10
        @scorecard << frames[frame].first
      end
      frame += 1
      rounds -= 1
    end

    return @scorecard.flatten.sum
  end
end