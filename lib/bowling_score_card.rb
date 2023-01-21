class BowlingScoreCard
  def initialize
    @rolls_score_raw_count = []
  end

  # keeps a track of the amount of pins knocked down in a roll (nothing to do with strike/spare aggregates)
  def roll(pins_down)
    @rolls_score_raw_count << pins_down
  end

  # manages the logic in relation to whether a frame is normal, spare or strike
  def overall_score
    score = 0
    frame = 0
    10.times do
      if is_a_strike?(frame)
        score += 10 + strike_bonus_score(frame)
        frame += 1
      elsif is_a_spare?(frame)
        score += 10 + spare_bonus_score(frame)
        frame += 2
      else
        score += sum_of_balls_in_frame(frame)
        frame += 2
      end
    end
    score
  end

  
  # adds the two rolls in a frame (called if not a strike)
  def sum_of_balls_in_frame(frame)
    @rolls_score_raw_count[frame] + @rolls_score_raw_count[frame + 1]
  end

  # handles the additional scoring following a spare frame
  def spare_bonus_score(frame)
    @rolls_score_raw_count[frame + 2]
  end

  # calculates whether a frame is a spare frame
  def is_a_spare?(frame)
    @rolls_score_raw_count[frame] + @rolls_score_raw_count[frame + 1] == 10
  end

  # calculates whether a frame is a strike frame
  def is_a_strike?(frame)
    @rolls_score_raw_count[frame] == 10
  end

  def strike_bonus_score(frame)
    @rolls_score_raw_count[frame + 1] + @rolls_score_raw_count[frame + 2]
  end
end
