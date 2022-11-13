class BowlingGame
  attr_reader :rolls, :frames

  def initialize
    @rolls = []
    @frames = []
  end

  def roll(pins)
    @rolls << pins

    if next_frame?
      frame = Frame.new(game: self)
      frame.roll(pins)
      frames << frame
    else
      frames.last.roll(pins)
    end
  end

  def score
    @frames.map(&:score).flatten.sum
  end

  def next_frame(frame:)
    current_index = frames.index(frame)
    frames[current_index + 1]
  end

  private

  def next_frame?
    frames.last.nil? || frames.last.rolls.size == 2
  end
end
