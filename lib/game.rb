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

    frames.last.add_bonus(pins) if frames.last.spare? && current_frame.rolls.count < 2
    frames.last.add_bonus(pins) if frames.last.strike?
    return if frames.count < 2

    frames[-2].add_bonus(pins) if frames[-2].strike? && number_of_rolls <= 2
  end

  def number_of_rolls
    (frames.last.rolls + current_frame.rolls).count
  end
end
