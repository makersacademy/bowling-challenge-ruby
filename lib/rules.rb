module Rules

  MAXIMUM_FRAMES = 10
  MAXIMUM_PINS = 10
  MAXIMUM_THROW = 10
  
  # Throw Validation

  def strike?
    first_throw == MAXIMUM_PINS
  end
  
  def spare?
    first_throw + second_throw = MAXIMUM_PINS
  end
  
  def pins_hit?
    both_throws != 0
  end
  
  def gutter?
    both_throws == 0
  end
  
  def both_throws
    first_throw + second_throw
  end

  # Max validation

  def single_turn_valid(bowl)
    bowl <= MAXIMUM_PINS
  end

  def both_turns_valid
    both_throws <= MAXIMUM_PINS
  end

  def max_throw
    MAXIMUM_THROW
  end
  
  def max_frames
    MAXIMUM_FRAMES
  end

  def max_pins
    MAXIMUM_PINS
  end
end
