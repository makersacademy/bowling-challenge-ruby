
class BowlingScorecard

  attr_reader :score

  def initialize
    @score = []
  end

  def bowl(pins)
    @score << pins
  end

  def score
    # @score.sum
    result = 0
    bowl_index = 0
    10.times do
      if strike?(bowl_index)
        result += strike_score(bowl_index)
        bowl_index += 1
      elsif spare?(bowl_index)
        result += spare_score(bowl_index)
        bowl_index += 2
      else
        result += frame_score(bowl_index)
        bowl_index += 2
      end
    end
    result
  end

  def spare?(bowl_index)
    @score[bowl_index] + @score[bowl_index + 1] == 10
  end

  def strike?(bowl_index)
    @score[bowl_index] == 10
  end

  def spare_score(bowl_index)
    @score[bowl_index] + @score[bowl_index + 1] + @score[bowl_index + 2]
  end

  def strike_score(bowl_index)
    10 + @score[bowl_index + 1] + @score[bowl_index + 2]
  end

  def frame_score(bowl_index)
    @score[bowl_index] + @score[bowl_index + 1]
  end

end