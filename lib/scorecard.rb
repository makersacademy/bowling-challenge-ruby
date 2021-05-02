# frozen_string_literal: true

class Scorecard
  attr_reader :scorecard, :roll, :frame

  STRIKE_SCORE = 10

  def initialize
    @scorecard = Array.new(12) { [0, 0] }
    @roll = 1
    @frame = 1
  end

  def add_score(score)
    if @roll == 1 #first roll of frame
      if score == STRIKE_SCORE
        @scorecard[@frame - 1] = [STRIKE_SCORE]
        next_frame
      else
        update_scorecard(score)
        @roll = 2
      end
    else #second roll of frame
      raise "Error: Score for frame is greater than 10" if (@scorecard[@frame - 1][@roll - 2] + score) > 10
      update_scorecard(score)
      next_frame
    end
  end

  def calculate_score
    total = 0
    @scorecard[0..9].each_with_index do |score, ind|
      total += if strike?(score)
                 STRIKE_SCORE + strike_bonuses(ind)
               elsif spare?(score)
                 10 + @scorecard[ind + 1][0]
               else
                 score.inject(:+)
               end
    end
    total
  end

  private

  def update_scorecard(score)
    @scorecard[@frame - 1][@roll - 1] = score
  end

  def next_frame
    @roll = 1
    @frame += 1
  end

  def strike?(score)
    score[0] == 10
  end

  def strike_bonuses(ind)
    if strike?(@scorecard[ind + 1])
      STRIKE_SCORE + @scorecard[ind + 2][0]
    else
      @scorecard[ind + 1].flatten.inject(:+)
    end
  end

  def spare?(score)
    score.inject(:+) == 10
  end
end
