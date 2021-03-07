class Game
  attr_reader :current_frame, :frames

  def initialize(frame_class = Frame)
    @frame_class = frame_class
    @current_frame = new_frame
    @frames = []
  end

  def add_roll(pins)
    current_frame.add_roll(pins)
    add_bonus(pins)
    return unless current_frame.over?

    frames << current_frame
    new_frame
    current_frame.final if frames.count == 9
  end

  def score
    0
  end

  private

  attr_reader :frame_class
  attr_writer :current_frame

  def new_frame
    self.current_frame = frame_class.new
  end

  def add_bonus(pins)
    return if frames.empty?

    frames.last.add_bonus(pins) if last_frame_bonus?
    return if frames.count < 2

    frames[-2].add_bonus(pins) if second_strike_bonus?
  end

  def last_frame_bonus?
    frames.last.spare? && current_frame.rolls.count < 2 ||
    frames.last.strike? && rolls_since_strike <= 3
  end

  def second_strike_bonus?
    frames[-2].strike? && rolls_since_strike <= 2
  end

  def rolls_since_strike
    (frames.last.rolls + current_frame.rolls).count
  end
end
