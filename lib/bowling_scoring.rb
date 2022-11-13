class BowlingScoring

  def initialize
    @score = []
  end

  def calculate(frames)
    rounds = frames.length
    frame = 0

    while rounds > 0 do
      @score << frames[frame]
      if frame > 0 && frames[frame - 1].first == 10
        @score << frames[frame].first(2)
      elsif frame > 0 && frames[frame - 1].sum == 10
        @score << frames[frame].first
      end
      frame += 1
      rounds -= 1
    end

    return @score.flatten.sum
  end
end