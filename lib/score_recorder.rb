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
      this_roll + 1
    end
  end

  def next_input_frame(frames)
    @frames = frames
    if game_end?
      nil
    elsif next_input_roll(frames) == 1
      this_frame + 1
    else
      this_frame
    end
  end

  private

  def this_roll
    @frames.last.length
  end

  def this_frame
    @frames.length
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
    @frames[-1].length == if extra_roll_required?
                            3
                          else
                            2
                          end
  end

  def extra_roll_required?
    tenth_frame? && (strike? || spare?)
  end

  def tenth_frame?
    @frames.length == 10
  end

  def strike?
    @frames[-1].first == 10
  end

  def spare?
    @frames[-1][0..1].sum == 10
  end

  def game_end?
    tenth_frame? && full_frame?
  end
end
