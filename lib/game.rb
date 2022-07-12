require_relative './score'

class Game
  attr_reader :throws, :score, :frame_count, :last_frame

  MAX_FRAME = 10

  def initialize(score = Score.new)
    @throws = []
    @frame_complete = true
    @score = score
    @frame_count = 1
    @last_frame = []
  end

  def add(pins)
    @throws << pins
    play_last_frame(pins) if last_frame?
    frame_status(pins)
    setup_next_roll(pins)
  end

  def frame_status(pins)
    @frame_complete = !@frame_complete if pins != 10
  end

  def frame_complete?
    @frame_complete
  end

  def setup_next_roll(pins)
    if frame_complete?
      @score.calculate(@throws)
      new_frame
    else
      @score.update_if_needed(pins)
    end
  end

  def new_frame
    @throws.clear
    @frame_count += 1
  end

  def last_frame?
    @frame_count >= MAX_FRAME
  end

  def play_last_frame(pins)
    @last_frame << pins
    finished if last_frame_complete?
  end

  def last_frame_complete?
    @last_frame.size == 2 && @last_frame.sum < 10 || @last_frame.size == 3
  end

  def finished
    @score.calculate_last_frame(@last_frame, MAX_FRAME)
    total = @score.total
    puts "You scored #{total} points!"
  end

  def scores
    @score.scores
  end
end
