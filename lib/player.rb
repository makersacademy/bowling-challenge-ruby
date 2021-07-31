class Player

  attr_reader :scores, :sum

  def initialize(scores = [], sum = 0)
    @scores = scores
    @sum = sum
  end

  def add(score)

    if !@scores.last || @scores.last.length == 2
      if score == 10
        @scores.push([10,0])
      else
        @scores.push([score])
      end
    else
      @scores.last.push(score)
    end
  end

  def sum
    @scores.flatten.sum
  end
end