class Frame
  def initialize
    @score = 0
    @rolls = []
    @status = :active
    @bonuses_left = 0
  end

  def add_roll(roll)
    raise "Can no longer add roll to this frame" if @status != :active
    validate_roll(roll)
    raise "Both rolls cannot add up to more than 10" if @score + roll > 10
    
    @score += roll.to_i
    @rolls << roll.to_i

    update_status
  end

  def add_bonus(roll)
    validate_roll(roll)
    if @bonuses_left.positive?
      @score += roll
      @bonuses_left -= 1
    end
    return nil
  end

  def score
    return @score
  end

  def status
    return @status
  end

  def rolls
    return @rolls
  end

  private

  # raises error if roll is not valid
  def validate_roll(roll)
    if !(roll.is_a?(Integer) || roll % 1 == 0)
      raise ArgumentError.new "A roll must be an integer"
    elsif roll.negative? || roll > 10
      raise ArgumentError.new "A roll must be between 0 and 10"
    end
  end

  def update_status
    if @score == 10 && @rolls.length == 1
      @status = :strike
      @bonuses_left = 2
    elsif @score == 10 && @rolls.length == 2
      @status = :spare
      @bonuses_left = 1
    elsif @rolls.length == 2
      @status = :done
    end
  end
end
