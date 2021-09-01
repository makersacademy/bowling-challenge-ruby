require_relative 'frame'
require_relative 'scoring'

class Game

  START_INDEX = 0
  FIRST_FRAME = 1
  LAST_FRAME = 10

  attr_reader :current_frame

  def initialize(frame_type = Frame)
    @frames = []
    populate_frames_array(frame_type)
    @current_frame = START_INDEX # change to current_frame_index?
    @frame = @frames[@current_frame] # change to current frame?
    # score array that matches frames array?
  end

  def roll(pins) 
    check_game   
    check_frame
    # check roll - using validity checker? (pins, remaining pins?)
    @frame.roll(pins)
  end

  def scorecard
    @frames.map { |frame| scorecard_string(frame) }.join("\n")
  end

  private
  
  def populate_frames_array(frame_type)
    (FIRST_FRAME..LAST_FRAME).map do |frame_id|
      @frames << frame_type.new(frame_id, LAST_FRAME) 
    end
  end

  def check_game
    raise 'Game complete' if @frame.full? && @frame == @frames.last
  end

  def check_frame
    @frame = @frames[@current_frame += 1] if @frame.full?
  end

  def scorecard_string(frame) # move to own class, use index + 1 to get frame #
    "Frame: #{frame.frame_id.to_s.ljust(2)} | #{frame.roll_1}"\
    " | #{frame.roll_2.to_s.ljust(1)} | "\
    "#{"#{frame.roll_3}" if frame.roll_3}"\
  end

end
