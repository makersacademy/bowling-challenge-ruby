require_relative 'validity'
require_relative 'roll'

class Frame
 
  def initialize(frame_id, total_frames)
    @last_frame = total_frames
    @frame_content = { frame_id: frame_id }
  end

  def roll(roll) 
    @roll = roll
    @roll_no = roll_1.nil? ? :roll_1 : roll_2.nil? ? :roll_2 : :roll_3
    frame_full? ? return : add
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

  def frame_full?
    frame_id < @last_frame ? frame_full? : final_frame_full?
  end
  
  private

  def add
    @frame_content[@roll_no] = @roll 
    @frame_content[@roll_no] = :/ if spare?
    @frame_content[@roll_no] = :X if strike?
  end

  def spare?
    @roll_no == :roll_2 && (roll_1 == :X ? false : roll_1 + roll_2 == 10 ? true : false)
  end

  def strike?
    (@roll_no == :roll_1 || frame_id == @last_frame) && @roll == 10
  end

  def frame_full?
    roll_1 == :X || !roll_2.nil?
  end

  def final_frame_full?
    !roll_3.nil? || (roll_1.is_a? Integer) && (roll_2.is_a? Integer)
  end

end
