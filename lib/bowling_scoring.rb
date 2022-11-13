class BowlingScoring

  def initialize(scorecard)
    @score = []
    @scorecard = scorecard
  end

  def calculate
    rounds = @scorecard.length
    frame = 0

    while rounds > 0 do
      @score << @scorecard[frame]
      if frame > 1 && @scorecard[frame - 1].first == 10 && @scorecard[frame - 2].first == 10
        @score << @scorecard[frame].first(2)
        @score << @scorecard[frame - 1].first(2)
      elsif frame > 0 && @scorecard[frame - 1].first == 10
        @score << @scorecard[frame].first(2)
      elsif frame > 0 && @scorecard[frame - 1].sum == 10
        @score << @scorecard[frame].first
      end
      frame += 1
      rounds -= 1
    end
    return @score.flatten.sum
  end
end
