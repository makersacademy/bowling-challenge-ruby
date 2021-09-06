class Frame

  attr_reader :score_this_frame
  
  def initialize(r1 = 0, r2 = 0, r3 = 0)
    @score_this_frame = 0
    @r1 = r1
    @r2 = r2
    @r3 = r3
  end

  def roll(r1, r2)
    if r1 == 10
      strike
    elsif r1 + r2 == 10
      spare
    else
      @score_this_frame = r1 + r2
    end
  end

  def strike
    @score_this_frame += 10
  end

  def spare
    @score_this_frame += 10
  end

end