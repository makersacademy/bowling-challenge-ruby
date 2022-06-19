class Game 

  attr_reader :frame, :roll, :pins_rolled, :continue

  def initialize
    @frame = 1
    @roll = 1
    @continue = true
    @pins_rolled = Array.new(10) {Array.new}
    @scores = Array.new(10){0}
  end

  def total_score
    @scores.sum
  end

  def roll_pin(pin)
    @pins_rolled[@frame - 1].push(pin)
    
    @scores[@frame-1] += pin # adding pin number as scores.... definitely need more calculations
    if @frame < 10
      if (@frame > 1) && spare(@pins_rolled[@frame - 2])
        @scores[@frame - 2] = @pins_rolled[@frame - 2].sum + @pins_rolled[@frame - 1][0]
      end

      if (@frame > 1) && strike(@pins_rolled[@frame - 2]) # if one strike
        @scores[@frame - 2] = @pins_rolled[@frame - 2].sum + @pins_rolled[@frame - 1].sum
      end

      if (@frame > 2) && (strike(@pins_rolled[@frame - 3])) && (strike(@pins_rolled[@frame - 2])) #if two consecutive strikes (will correct )
        @scores[@frame - 3] = @pins_rolled[@frame - 3].sum + @pins_rolled[@frame - 2].sum + @pins_rolled[@frame - 1][0]
      end
    end

    if @frame == 10
    end
    
    @continue = false if (@frame == 10) && (@roll == 2) && (@pins_rolled[9].sum <10)
    @continue = false if (@frame == 10) && (@roll == 3)
    if @continue == true
      if @frame == 10
        @roll += 1
      elsif pin < 10
        @frame += 1 if @roll == 2
        @roll == 1 ? @roll += 1 : @roll = 1
      elsif pin == 10 && @roll == 1
        @frame += 1
      end
    end
  end

  def spare(frame)
    return (!frame.include? 10) && (frame.sum == 10) ? true : false
  end

  def strike(frame)
    return (frame.include? 10) ? true : false
  end
end
