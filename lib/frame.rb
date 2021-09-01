require_relative 'validity'
require_relative 'roll'

class Frame

  FIRST_FRAME = 1
  LAST_FRAME = 10
  TOTAL_PINS = 10
  ERROR = 'Not a valid frame number'
  
  def initialize(frame_number = FIRST_FRAME, check = Validity.new)
    valid_frame_number_check(frame_number, check) # do I need this? 
    @frame_content = { frame_id: frame_number }
  end

  def add(roll, roller = Roll.new) 
    raise 'Frame complete' if full? # do i need this if in game class ?

    @roll = roller.roll(roll, pins_remaining)
    # move onto own line i.e. add(:roll_1) if roll_1.nil? etc
    roll_1.nil? ? add_roll(:roll_1) : roll_2.nil? ? add_roll(:roll_2) : add_roll(:roll_3)
  end

  def frame_id # do we need frame id?
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

  # def score
  #   @frame_content[:score]
  # end

  def full?
    frame_id < LAST_FRAME ? frame_full? : final_frame_full?
  end
  
  private

  # def frame_score(scorer = Scoring)
  #   frame = [{ roll_1: roll_1, roll_2: roll_2, roll_3: roll_3 }]
  #   @frame_content[score] = scorer.new(frame).calculation.sum
  # end

  def valid_frame_number_check(frame_id, check) # prob get rid of this as we use indexes in game class
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

  def frame_full?
    roll_1 == :X || !roll_2.nil?
  end

  def final_frame_full?
    !roll_3.nil? || (roll_1.is_a? Integer) && (roll_2.is_a? Integer)
  end

end
