class Scorecard
  attr_reader :player_name, :current_score, :current_frame

  def initialize(name)
    @player_name = name
    @current_score = 0
    @current_frame = 1
  end
end
