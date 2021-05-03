class ScoreRecorder
  def initialize
    @frames = []
  end

  def next_input_roll(frames)
    @frames = frames
    if game_end?
      nil
    elsif new_game? || completed_frame?
      1
    else
      2
    end
  end

  def next_input_frame(frames)
    @frames = frames
    if next_input_roll(frames) == 1
      next_frame
    else
      this_frame
    end
  end

  private

  def this_frame
    @frames.length
  end

  def next_frame
    this_frame + 1
  end

  def new_game?
    @frames == []
  end

  def completed_frame?
    if tenth_frame?
      full_frame?
    else
      full_frame? || strike?
    end
  end

  def full_frame?
    @frames[-1].length == 2 unless tenth_frame? && strike?
  end

  def tenth_frame?
    @frames.length == 10
  end

  def strike?
    @frames[-1] == [10]
  end

  def game_end?
    tenth_frame? && full_frame?
  end
end
