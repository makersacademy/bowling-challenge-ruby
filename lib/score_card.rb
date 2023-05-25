require 'frame'

class ScoreCard
  def initialize
    @frames = []
    # Initialize ten frames?
    # 10.times { @frames << Frame.new }
    @game_score = 0
  end

  # Methods to interact with frames and rolls
  def game_score
    return @game_score
  end
end
