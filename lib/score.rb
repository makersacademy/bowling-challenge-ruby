class PlayerGameScore
  attr_accessor :round_scores

  def initialize
    @round_scores = []
    @prev_round_strike = false
    @prev_round_spare = false 
    @round_counter = 0
    # Add a counter for number of strikes, if strikes = 12, total points = 300
  end

  def add_round(round)
    @round = round
    @points = @round.round_pins.inject(0, :+)
    @round_scores << @points
    
    self.calculate_bonus
    @round_counter += 1
  end

  def calculate_bonus
    @round_scores[@round_counter - 1] += @points if @prev_round_strike
    @round_scores[@round_counter - 1] += @round.round_pins[0] if @prev_round_spare
    @prev_round_strike = false
    @prev_round_spare = false

    @prev_round_strike = true if @round.strike == true
    @prev_round_spare = true if @round.spare == true
  end
end