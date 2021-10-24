# frozen_string_literal: true

class Scoring
  def initialize(scorecard)
    @scorecard = scorecard
  end

  def total_score
    total_score_per_frame.sum
  end

  # the below should be made private, but this will make unit tests fail

  def regular_score_per_frame
    score = @scorecard.map(&:sum)
    if @scorecard[9][0] == 10
      score[9] = 10
    elsif @scorecard[9][0] < 10
      score[0] = (@scorecard[9][0] + @scorecard[9][1])
    end
    score
  end

  # frames 9 and 10 handled in separate methods
  def bonus_score_per_frame
    score = []
    n = 0
    while n < 8
      bonus = 0
      if @scorecard[n][0] == 10
        bonus += if @scorecard[n + 1][0] == 10
                   if @scorecard[n + 2][0] == 10 # 3 strikes in a row
                     20
                   else 10 + @scorecard[n + 2][0] # 2 strikes in a row
                   end
                 else @scorecard[n + 1].sum # 1 strike
                 end
      elsif @scorecard[n].sum == 10 # a split
        bonus += @scorecard[n + 1][0]
      end
      score.append(bonus)
      n += 1
    end
    bonus_score_9th_frame(score)
  end

  def bonus_score_9th_frame(score)
    bonus = 0
    if @scorecard[8][0] == 10
      bonus += if @scorecard[8 + 1][0] == 10
                 if @scorecard[8 + 1][1] == 10 # 3 strikes in a row
                   20
                 else 10 + @scorecard[8 + 1][1] # 2 strikes
                 end
               else @scorecard[8 + 1][0] + @scorecard[8 + 1][1] # 1 strike
               end
    elsif @scorecard[8].sum == 10 # a split
      bonus += @scorecard[8 + 1][0]
    end
    score.append(bonus)
    bonus_score_10th_frame(score)
  end

  def bonus_score_10th_frame(score)
    bonus = 0
    if @scorecard[9][0] == 10 # strike, 2 extra rolls
      bonus += @scorecard[9][1] + @scorecard[9][2]
    elsif @scorecard[9][0] + @scorecard[9][1] == 10 # split, 1 extra roll
      bonus += @scorecard[9][2]
    end
    score.append(bonus)
    score
  end

  def total_score_per_frame
    score = []
    n = 0
    while n < 10
      total = 0
      total = regular_score_per_frame[n] + bonus_score_per_frame[n]
      score.append(total)
      n += 1
    end
    score
  end
end
