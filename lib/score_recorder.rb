class ScoreRecorder
  attr_reader :frames

  def initialize
    @frames = []
  end

  def test_setup(frames)
    @frames = frames if ENV['ENV'] == 'test'
  end

  def add_roll(score)
    if game_end?
      nil
    elsif next_input_roll == 1
      add_new_frame(score)
    else
      add_to_last_frame(score)
    end
  end

  def next_input_roll
    if game_end?
      nil
    elsif new_game? || completed_frame?
      1
    else
      this_roll + 1
    end
  end

  def next_input_frame
    if game_end?
      nil
    elsif next_input_roll == 1
      this_frame + 1
    else
      this_frame
    end
  end

  private

  def add_new_frame(score)
    @frames << [score]
  end

  def add_to_last_frame(score)
    @frames.last << score
  end

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
    @frames.last.length == if extra_roll_required?
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
    @frames.last.first == 10
  end

  def spare?
    @frames.last[0..1].sum == 10
  end

  def game_end?
    tenth_frame? && full_frame?
  end
end
