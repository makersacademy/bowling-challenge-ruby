class Frame

  attr_accessor :bonus_rolls
  attr_reader :roll_1, :roll_2, :score

  def initialize
    @score = 0
  end

  def add_roll(knocked_pins)
    validate_roll(knocked_pins)
    @roll_1 ? @roll_2 = knocked_pins : @roll_1 = knocked_pins
    check_completion
    summarise_frame if complete?
    return self
  end
  
  def add_points(points)
    @score += points
  end
  
  def strike?
    @roll_1 == 10
  end

  def spare?
    strike? ? false : @roll_2.nil? ? false : @roll_2 + @roll_1 == 10 
  end

  def complete?
    strike? || !@roll_2.nil? ? true : false
  end

  private

  def check_completion
    @roll_2 = nil if strike?
  end

  def validate_roll(knocked_pins)
    raise 'invalid roll' unless valid_roll?(knocked_pins)
  end

  def valid_roll?(knocked_pins)
    if knocked_pins > 10 
      false
    elsif @roll_1
      @roll_1 + knocked_pins <= 10 
    else
      true
    end
  end

  def count_pins
    strike? ? @roll_1 : @roll_1 + @roll_2
  end

  def bonus_rolls?
    strike? ? 2 : spare? ? 1 : 0
  end

  def summarise_frame
    @score = count_pins
    @bonus_rolls = bonus_rolls?
  end
end
