require_relative 'frame'
require_relative 'scoring'

class Game

  START_INDEX = 0

  attr_reader :current_frame

  def initialize(frame_type = Frame)
    @frames = []
    populate_frames_array(frame_type)
    @current_frame = START_INDEX
    @frame = @frames[@current_frame]
  end

  def roll(pins) 
    check_game   
    check_frame
    @frame.add(pins)
  end

  def scorecard
    @frames.map { |frame| scorecard_string(frame) }.join("\n")
  end

  private
  
  def populate_frames_array(frame_type)
    (frame_type::FIRST_FRAME..frame_type::LAST_FRAME).map do |id|
      @frames << frame_type.new(id) 
    end
  end

  def check_game
    raise 'Game complete' if @frame.full? && @frame == @frames.last
  end

  def check_frame
    @frame = @frames[@current_frame += 1] if @frame.full?
  end

  def scorecard_string(frame)
    "Frame: #{frame.frame_id.to_s.ljust(2)} | #{frame.roll_1}"\
    " | #{frame.roll_2.to_s.ljust(1)} | "\
    "#{"#{frame.roll_3}" if frame.roll_3}"\
  end

  def score_array(scorer = Scoring)
    frame_array = @frames.map do |frame| 
      { roll_1: frame.roll_1, roll_2: frame.roll_2, roll_3: frame.roll_3 }
    end
    scorer.new(frame_array).calculation
  end

end
