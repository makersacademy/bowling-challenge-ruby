class Scorecard
  attr_reader :player_name, :current_score

  def initialize(name)
    @player_name = name
    @current_score = 0
  end
end
