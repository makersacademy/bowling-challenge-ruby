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
    roll_tally = 0
    10.times do
      if is_a_strike?(roll_tally)
        score += 10 + strike_bonus_score(roll_tally)
        roll_tally += 1
      elsif is_a_spare?(roll_tally)
        score += 10 + spare_bonus_score(roll_tally)
        roll_tally += 2
      else
        score += sum_pins_down_in_frame(roll_tally)
        roll_tally += 2
      end
    end
    score
  end

  
  # adds the two rolls in a frame (called if not a strike)
  def sum_pins_down_in_frame(roll_tally)
    @rolls_score_raw_count[roll_tally] + @rolls_score_raw_count[roll_tally + 1]
  end

  # handles the additional scoring following a spare frame
  def spare_bonus_score(roll_tally)
    @rolls_score_raw_count[roll_tally + 2]
  end

  # calculates whether a frame is a spare frame
  def is_a_spare?(roll_tally)
    @rolls_score_raw_count[roll_tally] + @rolls_score_raw_count[roll_tally + 1] == 10
  end

  # calculates whether a frame is a strike frame
  def is_a_strike?(roll_tally)
    @rolls_score_raw_count[roll_tally] == 10
  end

  def strike_bonus_score(roll_tally)
    @rolls_score_raw_count[roll_tally + 1] + @rolls_score_raw_count[roll_tally + 2]
  end
end
