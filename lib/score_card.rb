require_relative 'frame'

class ScoreCard
  def initialize
    @total_score = 0
    @frames = []
    @round = 1
  end

  def current_frame
    @round
  end

  def frames
    @frames
  end
  
  def new_frame(round)
    Frame.new(@round)
  end

  def total_score
    @total_score
  end

  def add_to_total(num)
    @total_score += num
  end

  def play_frame(roll_1, roll_2)
   this_frame = Frame.new(@round)
  #  roll 1 and 2 would usually be calculated as follows
  #  but for testing purposes I need to unput them
  #  roll_1 = this_frame.add_frame_total(random(11))
  #  roll_1 = this_frame.add_frame_total(random(11))
   if roll_1 >= 10
    @total_score += roll_1
    this_frame.strike
    @frames << this_frame
    @round += 1
   end
  end
end


