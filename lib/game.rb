require_relative 'frame'
require_relative 'scorecard'
require_relative 'scoring'
require_relative 'validity'

class Game

  START_INDEX = 0
  FIRST_FRAME = 1
  LAST_FRAME = 10

  def initialize(frame_type = Frame)
    @frames = []
    populate_frames_array(frame_type)
    @current_frame_index = START_INDEX
    @current_frame = @frames[@current_frame_index]
  end

  def roll(pins) 
    check_game   
    check_frame
    @current_frame.roll(pins) # if passes validity check with pins remaining?
  end

  def scorecard(scorecard_printer = Scorecard.new)
    scores = get_rolls
    scorecard_printer.scorecard(@frames, scores.calculation)
  end

  private
  
  def populate_frames_array(frame_type)
    (FIRST_FRAME..LAST_FRAME).map do |frame_id|
      @frames << frame_type.new(frame_id, LAST_FRAME) 
    end
  end

  def check_game
    raise 'Game complete' if @current_frame.full? && @current_frame == @frames.last
  end

  def check_frame
    @current_frame = @frames[@current_frame_index += 1] if @current_frame.full?
  end

  def get_rolls(scorer = Scoring)
    scorer.new(@frames.map do |frame| 
      { roll_1: frame.roll_1, roll_2: frame.roll_2, roll_3: frame.roll_3 }
    end)
  end

end
