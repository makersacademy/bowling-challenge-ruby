require 'frame'

class Game

  attr_reader :current_frame

  def initialize(frame_class = Frame)
    @frame_class = frame_class
    @current_frame = frame_class.new
    @frames = []
  end

  def input_roll(pins)
    @current_frame.extra ? extra_roll(pins) : normal_roll(pins)
    decision_on_extra_roll
    next_frame if @current_frame.complete?
  end

  def normal_roll(pins)
    @current_frame.roll(pins)
  end

  def extra_roll(pins)
    @current_frame.non_scoring_roll(pins)
    @current_frame.add_bonus(pins)
  end

  def last_frame?
    @frames.length == 9
  end

  def decision_on_extra_roll
    @current_frame.extra_roll if last_frame? && (@current_frame.strike? || @current_frame.spare?)
  end

  def next_frame
    @frames << @current_frame
    create_frame
  end

  def create_frame
    @current_frame = @frame_class.new
  end

  def frames
    @frames.dup
  end

  def calculate_bonus
    spare_bonus
    strike_bonus
  end

  def spare_bonus
    @frames.each_with_index { |frame, index| 
      if frame.spare?
        frame.add_bonus(@frames[index + 1].rolls[0]) unless index == 9
      end
    }
  end

  def strike_bonus
    @frames.each_with_index { |frame, index|
      if frame.strike?
        unless index == 9
          rolls_left_to_count = 2
          i = 1
          while rolls_left_to_count > 0
            @frames[index + i].rolls.each { |roll| frame.add_bonus(roll)
            rolls_left_to_count -= 1
            break if rolls_left_to_count == 0 }
            i += 1
          end
        end
      end
    }
  end

  def total_score
    calculate_bonus
    @frames.map{ |frame| frame.score + frame.bonus }.reduce(:+)
  end


end