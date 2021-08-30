require_relative 'validity'
require_relative 'roll'

class Frame

  FIRST_FRAME = 1
  LAST_FRAME = 10
  TOTAL_PINS = 10
  ERROR = 'Not a valid frame number'
  
  def initialize(frame_number, check = Validity.new)
    valid_frame_number_check(frame_number, check)
    @frame_content = { frame_id: frame_number }
  end

  def add(roll, roller = Roll.new) 
    frame_full_check
    @roll = roller.roll(roll, pins_remaining)
    roll_1.nil? ? add_roll(:roll_1) : roll_2.nil? ? add_roll(:roll_2) : add_roll(:roll_3)
  end

  def frame_id
    @frame_content[:frame_id]
  end

  def roll_1
    @frame_content[:roll_1]
  end

  def roll_2
    @frame_content[:roll_2]
  end

  def roll_3
    @frame_content[:roll_3]
  end
  
  def print_frame
    "Frame: #{frame_id} | 1st roll: #{roll_1} |"\
    " 2nd roll: #{roll_2}#{" | 3rd roll: #{roll_3}" if roll_3}"
  end

  private

  def valid_frame_number_check(frame_id, check)
    raise ERROR unless check.valid?(frame_id, FIRST_FRAME, LAST_FRAME)
  end

  def add_roll(roll_no)
    @frame_content[roll_no] = @roll
    @frame_content[roll_no] = :/ if roll_no == :roll_2 && spare?
    @frame_content[roll_no] = :X if (roll_no == :roll_1 || frame_id == LAST_FRAME) && strike?
  end

  def pins_remaining
    !roll_1.nil? && roll_1 != :X && roll_2.nil? ? TOTAL_PINS - roll_1 : TOTAL_PINS
  end

  def spare?
    return if roll_1 == :X
    
    roll_1 + roll_2 == TOTAL_PINS
  end

  def strike?
    @roll == TOTAL_PINS
  end

  def frame_full_check
    test = frame_id < LAST_FRAME ? frame_full? : final_frame_full?
    raise 'Frame complete' if test
  end

  def frame_full?
    roll_1 == :X || !roll_2.nil?
  end

  def final_frame_full?
    !roll_3.nil? || (roll_1.is_a? Integer) && (roll_2.is_a? Integer)
  end

end
