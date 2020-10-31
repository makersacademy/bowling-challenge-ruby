class Frame
  def initialize(rolls: [], bonus_rolls: [], number:)
    @rolls = rolls
    @bonus_rolls = bonus_rolls
    @number = number
  end

  def rolls(n)
    !!@rolls[n] ? @rolls[n] : 0
  end

  def bonus_rolls(n)
    !!@bonus_rolls[n] ? @bonus_rolls[n] : 0
  end

  def roll(n)
    if @rolls.length < 2 && !strike?
      @rolls.push(n)
    else
      @bonus_rolls.push(n)
    end
  end

  def pins
    @rolls.sum
  end

  def strike?
    @rolls.first == 10
  end

  def spare?
    pins == 10 && !strike?
  end

  def score(next_frame_1 = nil, next_frame_2 = nil)
    pins + bonus(next_frame_1, next_frame_2)
  end

  def bonus(next_frame_1 = nil, next_frame_2 = nil)
    if strike?
      next_roll_1(next_frame_1) + next_roll_2(next_frame_1, next_frame_2)
    elsif spare?
      next_roll_1(next_frame_1)
    else
      0
    end
  end

  def next_roll_1(next_frame_1 = nil)
    if @number == 10
      bonus_rolls(0)
    else
      next_frame_1.rolls(0)
    end
  end

  def next_roll_2(next_frame_1 = nil, next_frame_2 = nil)
    if @number == 10
      bonus_rolls(1)
    elsif @number == 9 && next_frame_1.strike?
      next_frame_1.bonus_rolls(0)
    elsif next_frame_1.strike?
      next_frame_2.rolls(0)
    else
      next_frame_1.rolls(1)
    end
  end
end
