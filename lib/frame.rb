class Frame
 
  def initialize(frame_id, total_frames)
    @last_frame = total_frames
    @frame_content = { frame_id: frame_id }
  end

  def roll(roll) 
    @roll = roll
    @roll_no = roll_1.nil? ? :roll_1 : roll_2.nil? ? :roll_2 : :roll_3
    @frame_content[@roll_no] = add unless full?
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

  def full?
    frame_id < @last_frame ? frame_full? : final_frame_full?
  end
  
  private

  def add
    @frame_content[@roll_no] = @roll
    spare? ? :/ : strike? ? :X : @roll
  end

  def spare?
    @roll_no == :roll_2 && 
    (roll_1 == :X ? false : roll_1 + @roll == 10)
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
