require_relative 'frame'

class Game
  attr_reader :frames
  
  def initialize(frames = Frame.new)
    @frames = [frames]
  end

  def roll(pins)
    case 
    when frame_count < 9 && current_frame.in_play
         current_frame.knocked(pins)
         point_bonus(pins) if last_frame_strike?
    when frame_count < 9 && !current_frame.in_play
         new_frame
         current_frame.knocked(pins)
         point_bonus(pins) if (last_frame_strike? && pins == 10)
         point_bonus(pins) if (last_frame_strike? || last_frame_spare?)
    when frame_count == 9 && !current_frame.in_play
         new_frame_10
         current_frame.knocked(pins)
         point_bonus(pins) if (last_frame_strike? && pins == 10)
         point_bonus(pins) if (last_frame_strike? || last_frame_spare?)
    else frame_count == 10 && current_frame.in_play
         current_frame.knocked(pins)
    end
  end

  def total_score
    total_score = @frames.map {|frame | frame.score }.sum
  end

  def last_frame_strike?
    last_frame.strike?
  end

  def last_frame_spare?
    last_frame.spare?
  end

  def frame_count
    @frames.length
   end

 private
   
  def point_bonus(pins)
    last_frame.point_bonus(pins) unless frame_count == 1
  end

  def new_frame
    @frames << Frame.new
  end

  def new_frame_10
    @frames << Frame.new(true)
  end

  def current_frame
    @frames.last
  end

  def last_frame
    @frames[frame_count - 2]
  end

end