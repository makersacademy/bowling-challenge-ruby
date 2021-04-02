class ScoreCard

  attr_reader :frame_count, :roll_count, :hit_pins_per_roll, :hit_pins_per_frame

  def initialize
    @frame_count = 1
    @roll_count = 1
    @hit_pins_per_roll = []
    @hit_pins_per_frame = []
  end

  def next_frame
    @frame_count += 1 unless @frame_count >= 10
    save_frame
  end 

  def next_roll 
    @roll_count >= 2 ? @roll_count -= 1 : @roll_count += 1 
    next_frame if @roll_count == 1
  end 

  def roll(user_input)
    @hit_pins_per_roll << user_input
    next_roll
  end

  def save_frame
    @hit_pins_per_frame << @hit_pins_per_roll
  end
end 