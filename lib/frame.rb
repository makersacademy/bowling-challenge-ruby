class Frame

  def initialize
    @roll_number = 0
    @total_rolls = 2
  end

  def strike(roll)
    if roll == 10
      puts "You got a strike!"
      return true
    end
  end

  def spare
    if ((@roll1 + @roll2) == 10)
      puts "You got a spare!"
      return true
    end
  end

  def frame_start
    @roll1 = roll1
    if strike(@roll1)
      value = [10, nil, 2]
    else
      @roll2 = roll2(@roll1)
      # if strike(@roll2)
      #   @bonus = 1
      if spare
        @bonus = 1
      else
        @bonus = 0
      end
      value = [@roll1, @roll2, @bonus]
    end
    return value
  end

  def frame_10_start
    @roll1 = roll1
    if strike(@roll1)
      @total_rolls = 3
      @roll2 = roll1
    else
      @roll2 = roll2(@roll1)
      @total_rolls = 3 if spare
    end
    @roll_number < @total_rolls ? @roll3 = roll1 : @roll3 = nil
    value = [@roll1, @roll2, @roll3]
    return value
  end

  def roll1
    roll = rand(0..10)
    puts "You rolled #{roll}."
    @roll_number += 1
    return roll
  end

  def roll2(roll)
    pins_left = (10-roll)
    roll = rand(1..pins_left)
    puts "The second roll was #{roll}."
    @roll_number += 1
    return roll
  end
end
