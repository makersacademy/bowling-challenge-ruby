class FrameScore

  attr_reader :frame_rolls

  def initialize
    @frame_rolls = []
  end

  def single_frame_roll(roll_score)
    raise "Enter a score between 0-10" if roll_score.class != Integer ||
    !roll_score.between?(0, 10)

    raise "Total score more than 10" if @frame_rolls[0] != nil && 
    (@frame_rolls[0] + roll_score) > 10

    @frame_rolls << roll_score
  end

  def clear
    @frame_rolls = []
  end

end
