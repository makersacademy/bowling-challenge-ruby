class Frame

  attr_reader :pins_left, :roll_counter

  def initialize 
  @rolls = []
  #@closed = false
  @pins_left = 10
  @roll_counter = 0
  end

  def roll(pins)
    @rolls << pins
    @roll_counter += 1
    @pins_left = @pins_left - pins
  end

  def frame_score
    @rolls
  end

   def frame_total
    frame_score.inject(:+)
  end

  def strike
    @rolls[0] == 10
  end

  def spare
    @rolls[0] + @rolls[1] == 10
  end

  def closed?
    if @roll_counter == 2
      @closed = true
    elsif @pins_left == 0
      @closed = true
    else
      false
    end
  end

  def bonus
  end
    
end