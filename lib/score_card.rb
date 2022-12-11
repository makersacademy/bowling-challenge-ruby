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
    Frame.new(round)
  end

  def total_score
    @total_score
  end

  def add_to_total(num)
    @total_score += num
  end

  def prev_frame
    if @round > 1
    @frames[@round-2]
    else
    "There are no previous rounds"
    end
  end

  def play_frame(roll_1, roll_2)

    this_frame = Frame.new(@round)
    
  #   p "round minus 1 #{@round-1}"
  # #  roll 1 and 2 would usually be calculated as follows
  # #  but for testing purposes I need to unput them
  # #  roll_1 = this_frame.add_frame_total(random(11))
  # #  roll_2 = this_frame.add_frame_total(random(11))
    
    if roll_1 == 10
      this_frame.add_frame_total(roll_1)
      this_frame.strike
      this_frame.add_roll_1(roll_1)
      this_frame.add_roll_2(0)
    elsif (roll_1 + roll_2) == 10
      this_frame.spare
      this_frame.add_roll_1(roll_1)
      this_frame.add_roll_2(roll_2)
    else
      this_frame.add_roll_1(roll_1)
      this_frame.add_roll_2(roll_2)
    end
    if @round > 1 && self.prev_frame.is_strike?
      self.prev_frame.add_bonus(roll_1 + roll_2)
    elsif @round > 1 && self.prev_frame.is_spare?
      self.prev_frame.add_bonus(roll_1)
    end
    @frames << this_frame
    @round += 1
  #  return ''
  end
end


# scoreCard = ScoreCard.new
# # puts "current frame: #{scoreCard.current_frame}"
# # puts "play frame" 
# scoreCard.play_frame(10, 0)
# # puts "array of frames: #{scoreCard.frames}"
# # puts "current frame: #{scoreCard.current_frame}"
# # puts "play frame" 
# scoreCard.play_frame(10, 0)
# # puts "frame number at frames[0]: #{scoreCard.frames[0].frame}"
# # puts "frame number at frames[1]: #{scoreCard.frames[1].frame}"
# # puts "previous frame: #{scoreCard.prev_frame.frame}"
