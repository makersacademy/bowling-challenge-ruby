require_relative 'validity'

class Frame

  FIRST_FRAME = 1
  LAST_FRAME = 10
  TOTAL_PINS = 10
  ERROR = 'Not a valid frame number'
  
  def initialize(frame_number, check = Validity.new)
    valid_frame_number_check(frame_number, check)
    @frame_content = { frame_id: frame_number }
  end

  def add(roll) # could build in validity checking here by dependency injecting Roll class
    raise 'Frame complete' if frame_full?
  
    frame_score_1.nil? ? first_roll(roll) : frame_score_2.nil? ? second_roll(roll) : third_roll(roll)
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

  def frame_score_3
    @frame_content[:roll_three]
  end
  
  def print_frame
    "Frame: #{frame_id} | 1st roll: #{frame_score_1} |"\
    " 2nd roll: #{frame_score_2}"\
    "#{" | 3rd roll: #{frame_score_3}" if frame_score_3}"
  end

  private

  def valid_frame_number_check(frame_id, check)
    raise ERROR unless check.valid?(frame_id, FIRST_FRAME, LAST_FRAME)
  end

  def first_roll(roll)
    @frame_content[:roll_one] = roll
    @frame_content[:roll_one] = :X if strike?(roll)
  end

  def second_roll(roll)
    @frame_content[:roll_two] = roll
    @frame_content[:roll_two] = :/ if spare?
    @frame_content[:roll_two] = :X if strike?(roll)
  end

  def third_roll(roll)
    @frame_content[:roll_three] = roll
    @frame_content[:roll_three] = :X if strike?(roll)
  end

  def spare?
    return if frame_score_1 == :X
    frame_score_1 + frame_score_2 == TOTAL_PINS
  end

  def strike?(roll)
    roll == TOTAL_PINS
  end

  def frame_full?
    frame_id < LAST_FRAME ? normal_frame_full? : final_frame_full? 
  end

  def normal_frame_full?
    frame_score_1 == :X || !frame_score_2.nil?
  end

  def final_frame_full?
    !frame_score_3.nil? || (frame_score_1.is_a? Integer) && (frame_score_2.is_a? Integer)
  end

end
