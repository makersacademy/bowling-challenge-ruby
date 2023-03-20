class BowlingCalculator
  def initialize
    @frames = [
      [nil, nil],
      [nil, nil],
      [nil, nil],
      [nil, nil],
      [nil, nil],
      [nil, nil],
      [nil, nil],
      [nil, nil],
      [nil, nil],
      [nil, nil],
      [nil, nil]
    ]
  end

  def register_next_roll(pins_knocked)
    for i in 0 ... @frames.length
      frame = @frames[i]

      for j in 0 ... frame.length
        if frame[j] == nil
          frame[j] = pins_knocked

          if pins_knocked == 10 && j == 0 && i != @frames.length - 1 
            frame[j + 1] = "x"
          end

          return
        end
      end
    end
  end

  def get_score
    total_score = 0
    for i in 0 ... @frames.length - 1
      frame = @frames[i]
      for j in 0 ... frame.length
        if frame[j] != nil && frame[j] != "x"
          total_score += frame[j]
        end
      end

      roll_1 = frame[0]
      roll_2 = frame[1]

      if roll_1 == 10
        total_score += get_strike_extra_points(i)
      elsif roll_1 + roll_2 == 10
        total_score += get_spare_extra_points(i)
      end
    end

    return total_score
  end

  def can_still_play?
    for i in 0 ... @frames.length - 1
      frame = @frames[i]
      frame.each do |roll|
        return true if roll == nil
      end
    end

    can_play_bonus_frame?
    return false
  end

  private

  def get_strike_extra_points(i)
    counter = 0
    extra_score = 0

    for j in i + 1 ... @frames.length
      next_frame = @frames[j]
      for k in 0 ... next_frame.length
        roll = next_frame[k]
        if roll != nil && roll != "x" && counter < 2
          extra_score += roll
          counter += 1
        end
      end
    end

    return extra_score
  end

  def get_spare_extra_points(i)
    extra_score = 0
    next_frame = @frames[i + 1]
    next_roll = next_frame[0]

    if next_roll != nil
      extra_score += next_roll
    end

    return extra_score
  end

  def can_play_bonus_frame?
    last_frame = @frames[@frames.length - 2]
    extra_frame = @frames[@frames.length - 1]
    can_play_spare = extra_frame[0] == nil && last_frame[0] + last_frame[1] == 10
    can_play_strike = extra_frame[1] == nil && last_frame[0] == 10

    return true if can_play_spare
    return true if can_play_strike
  end
end
