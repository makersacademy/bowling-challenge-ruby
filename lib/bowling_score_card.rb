class BowlingScoreCard
  def initialize
    @rolls = []
  end

  def roll(pins_down)
    @rolls << pins_down
  end

  def score
    score = 0
    frame = 0
    10.times do
      score += sum_of_balls_in_frame(frame)
      frame += 2
    end
    score
  end

  def sum_of_balls_in_frame(frame)
    @rolls[frame] + @rolls[frame + 1]
  end
end