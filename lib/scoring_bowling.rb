class Scoring_Bowling

  MAX_FRAMES = 10

  attr_reader :bowls, :frame

  def initialize
    @bowls = []
    @frame = 0
  end

  def add_bowl(first_bowl, second_bowl = nil)
    raise 'Game Over, no more scores can be added' if bowls.count == MAX_FRAMES

    @bowls << {frame: frame_count, bowls: [first_bowl, second_bowl]}
  end

  private

  def frame_count
    @frame += 1
  end

end
