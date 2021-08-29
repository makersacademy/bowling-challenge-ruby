class Game 
  # needs to store player instances 
  # needs to calculate bonus points to add to score 
  attr_reader :num_players, :players
  
  def initialize(num_players)
    @num_players = num_players
    @players = Array.new
  end 

  def names(*args)
    @players << ["Jack", "Jill"]
  end

end
