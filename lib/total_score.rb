require frame

class Total
  def initialize
    hold = []
    sum = 0
  end

  def frame
    if @total < 10
      sum += @total
    else
      hold << @total
    end

    p sum
  end

end