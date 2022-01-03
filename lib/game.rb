require 'frame'

class Game

  attr_reader :current_frame

  def initialize(frame_class = Frame)
    @frame_class = frame_class
    @current_frame = frame_class.new
    @frames = []
  end

  def input_roll(pins)
    @current_frame.roll(pins)
    next_frame if @current_frame.complete?
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
    @frames.each_with_index { |frame, index| 
                              if frame.spare?
                                frame.add_bonus(@frames[index + 1].rolls[0])
                              elsif frame.strike?
                                rolls_left_to_count = 2
                                i = 1
                                while rolls_left_to_count > 0
                                  @frames[index + i].rolls.each { |roll| frame.add_bonus(roll)
                                  rolls_left_to_count -= 1 }
                                  i += 1
                                end
                                # frame.add_bonus(@frames[index+1].score)
                              end
                            }
  end

  def total_score
    calculate_bonus
    @frames.map{ |frame| frame.score + frame.bonus }.reduce(:+)
  end

end