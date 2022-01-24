# frozen_string_literal: true

class Scorecard
  attr_reader :scorecard

  def initialize
    @scorecard = []
  end

  def scoring(scores)
    frame = 1
    scores.each do |score|
      break if frame == 11
      result = 0
      if strike?(score)
        result += 10
        strike?(scores[frame]) ? result += 10 + scores[frame + 1][0] : result += scores[frame].sum
      elsif spare?(score)
        result += 10
        result += scores[frame][0]
      else
        result += score.sum
      end
      @scorecard << result
      frame += 1
    end
    @scorecard
  end


  private

  def strike?(score)
    score[0] == 10
  end

  def spare?(score)
    score.sum == 10
  end

end
