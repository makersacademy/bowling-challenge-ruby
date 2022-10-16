class PlayerGameScore
  attr_accessor :round_scores

  def initialize
    @round_scores = []
    # Add a counter for number of strikes, if strikes = 12, total points = 300
  end

  def add_round(round)
    points = round.round_pins.inject(0, :+)
    @round_scores << points
    
  end
end