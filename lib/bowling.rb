# Game responsible for collecting throws and counting frames

require_relative './scorer'

class Bowling
  attr_reader :throws, :scorer, :frame_count, :final_frame

  FRAME_LIMIT = 10

  def initialize(scorer = Scorer.new)
    @throws = []
    @frame_complete = true
    @scorer = scorer
    @frame_count = 1
    @final_frame = []
  end

  def add(pins)
    @throws << pins
    play_final_frame(pins) if final_frame?
    frame_status(pins)
    setup_next_roll(pins)
  end

  # this method sets frame_complete to false if 2nd roll is needed
  def frame_status(pins)
    @frame_complete = !@frame_complete if pins != 10
  end

  def frame_complete?
    @frame_complete
  end

  def setup_next_roll(pins)
    if frame_complete?
      @scorer.calculate(@throws)
      new_frame
    else
      @scorer.update_if_needed(pins)
    end
  end

  def new_frame
    @throws.clear
    @frame_count += 1
  end

  def final_frame?
    @frame_count >= FRAME_LIMIT
  end

  def play_final_frame(pins)
    @final_frame << pins
    gameover if final_frame_complete?
  end

  def final_frame_complete?
    @final_frame.size == 2 && @final_frame.sum < 10 || @final_frame.size == 3
  end

  def gameover
    @scorer.calculate_final_frame(@final_frame, FRAME_LIMIT)
    total = @scorer.total
    p "Gameover! You scored #{total} points!"
  end

  def scores
    @scorer.scores
  end
end
