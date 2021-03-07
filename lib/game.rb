class Game
  attr_reader :current_frame, :frames

  def initialize(frame_class = Frame, score_board = ScoreBoard)
    @frame_class = frame_class
    @score_board = score_board
    @current_frame = frame_class.new
    @frames = []
  end

  def add_roll(pins)
    current_frame.add_roll(pins)
    add_bonus(pins)
    return unless current_frame.over?

    finish_frame
  end

  def score
    score_board.total_score(frames)
  end

  private

  attr_reader :frame_class, :score_board
  attr_writer :current_frame

  def finish_frame
    frames << current_frame
    return if game_over?

    self.current_frame = frame_class.new
    current_frame.final if frames.count == 9
  end

  def game_over?
    frames.count == 10
  end

  def add_bonus(pins)
    return if frames.empty?

    frames.last.add_bonus(pins) if last_frame_bonus?
    return if frames.count < 2

    frames[-2].add_bonus(pins) if second_strike_bonus?
  end

  def last_frame_bonus?
    frames.last.spare? && current_frame.rolls.count <= 1 ||
      frames.last.strike? && rolls_since_strike <= 3
  end

  def second_strike_bonus?
    frames[-2].strike? && rolls_since_strike <= 2
  end

  def rolls_since_strike
    (frames.last.rolls + current_frame.rolls).count
  end
end
