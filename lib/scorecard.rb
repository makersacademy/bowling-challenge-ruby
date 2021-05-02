# frozen_string_literal: true

class Scorecard
  attr_reader :scorecard, :roll, :frame

  STRIKE_SCORE = 10

  def initialize
    @scorecard = Array.new(12) { [nil, nil] }
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
      if strike?(score)
        total += STRIKE_SCORE + strike_bonuses(ind)
      elsif spare?(score)
        total += 10 + @scorecard[ind + 1][0].to_i
      else
        total += score.compact.inject(:+) || 0
      end
    end
    total
  end

  def game_over?
    return false if @frame < 11 ||
             (@frame == 11 && (strike?(@scorecard[9]) || spare?(@scorecard[9]) && @scorecard[10][0] == nil)) ||
             (@frame == 12 && strike?(@scorecard[9]) && strike?(@scorecard[10]) && @scorecard[11][0] == nil)
    true
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
      @scorecard[ind + 1][0].to_i + @scorecard[ind + 1][1].to_i
    end
  end

  def spare?(score)
    score.compact.inject(:+) == 10
  end
end
