require_relative 'frame'

class Scorecard
  def initialize
    @frames = []
  end

  def add(frame)
    @frames << frame
  end

  def calculate_frame(number)
    if @frames[number - 1].strike?
      if @frames[number].strike?
        return 20 + @frames[number + 1].roll_1
      end

      return 10 + @frames[number].sum
    elsif @frames[number - 1].spare?
      return 10 + @frames[number].roll_1
    else
      return @frames[number - 1].sum
    end
  end

  def calculate_total_score
    score = (1..10).map do |number|
      calculate_frame(number)
    end

    return score.sum
  end
end