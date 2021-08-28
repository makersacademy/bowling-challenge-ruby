require_relative 'validity'

class Frame

  FIRST_FRAME = 1
  LAST_FRAME = 10
  TOTAL_PINS = 10
  ROLL_MIN = 0
  ERROR_MESSAGE = 'Not a valid frame number'

  def initialize(frame_id, check = Validity.new)
    raise ERROR_MESSAGE unless check.valid?(frame_id, FIRST_FRAME, LAST_FRAME)
    
    @content = { frame: frame_id, 1 => nil, spare: nil, strike: nil }
    @remaining_pins = TOTAL_PINS
    @check = check
  end

  def add(roll)
    raise 'Frame complete' if full?
    
    roll_check(roll)
    @content[1].nil? ? first_roll(roll) : second_roll(roll)
  end
  
  def print_frame
    "Frame: #{@content[:frame]} | 1st roll: #{@content[1]} |"\
    " 2nd roll: #{@content[2]} | Bonus: #{check_bonus}"
  end

  private
  
  def roll_check(roll)
    p @remaining_pins
    valid = @check.valid?(roll, ROLL_MIN, @remaining_pins)
    raise 'Invalid roll' unless valid
  end

  def first_roll(roll)
    @content[:strike] = true && @content[2] = 0 if strike?(roll)
    @content[1] = roll
    @remaining_pins -= roll
  end

  def second_roll(roll)
    @content[2] = roll
    @content[:spare] = spare?
  end

  def spare?
    @content[1] + @content[2] == TOTAL_PINS
  end

  def strike?(roll)
    @content[1].nil? && roll == TOTAL_PINS
  end

  def check_bonus
    @content[:strike] ? 'X' : @content[:spare] ? '/' : nil
  end

  def full?
    !@content[1].nil? && !@content[2].nil?
  end

end
