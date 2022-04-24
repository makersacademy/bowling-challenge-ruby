class Scorecard
  
  attr_reader :bowls

  def initialize
    @bowls = []
  end

  def bowl(pins)
    @bowls.push(pins)
  end

  def score
    bowl_total = 0
    b = 0
    while b < 10 do
      if spare?(@bowls[b], @bowls[b+1])
        bowl_total += bonus(@bowls[b], @bowls[b+1], @bowls[b+2])
      else
        bowl_total += bowl_score(@bowls[b], @bowls[b+1])
      end
      b += 2
    end
    bowl_total
  end

  def bowl_score(bowl_1, bowl_2)
    bowl_1 + bowl_2
  end

  def spare?(bowl_1, bowl_2)
    bowl_1 + bowl_2 == 10
  end
  
  def bonus(bowl_1, bowl_2, bowl_3)
    bowl_1 + bowl_2 + bowl_3
  end

end
