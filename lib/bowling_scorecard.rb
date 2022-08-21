require_relative 'frame'

class BowlingScorecard
  def initialize(io = Kernel)
    @io = io
  end
  
  def roll(pinfall, frame)
    frame.rolls << pinfall
    if pinfall == 10
      frame.bonus_rolls += 2
    elsif frame.rolls.sum == 10
      frame.bonus_rolls += 1
    end
  end

  def frame_loop
    current_frame = Frame.new
  end
end
