require_relative 'validity'

class Frame

  FIRST_FRAME = 1
  LAST_FRAME = 10
  TOTAL_PINS = 10
  ERROR_MESSAGE = 'Not a valid frame number'

  def initialize(frame_number, check = Validity.new)
    valid_frame_number_check(frame_number, check)
    @frame_content = { frame_id: frame_number }
  end

  def add(roll) # could build in validity checking here by dependency injecting Roll class
    raise 'Frame complete' if frame_full?
  
    @frame_content[:roll_one].nil? ? first_roll(roll) : second_roll(roll)
  end

  def frame_id
    @frame_content[:frame_id]
  end

  def frame_score_1
    @frame_content[:roll_one]
  end

  def frame_score_2
    @frame_content[:roll_two]
  end
  
  def print_frame
    "Frame: #{frame_id} | 1st roll: #{frame_score_1} |"\
    " 2nd roll: #{frame_score_2}"
  end

  private

  def valid_frame_number_check(frame_id, check)
    raise ERROR_MESSAGE unless check.valid?(frame_id, FIRST_FRAME, LAST_FRAME)
  end

  def first_roll(roll)
    @frame_content[:roll_one] = roll
    @frame_content[:roll_one] = :X if strike?
  end

  def second_roll(roll)
    @frame_content[:roll_two] = roll
    @frame_content[:roll_two] = :/ if spare?
  end

  def spare?
    @frame_content[:roll_one] + @frame_content[:roll_two] == TOTAL_PINS
  end

  def strike?
    @frame_content[:roll_one] == TOTAL_PINS
  end

  def frame_full?
    @frame_content[:roll_one] == :X || !@frame_content[:roll_two].nil?
  end

end
