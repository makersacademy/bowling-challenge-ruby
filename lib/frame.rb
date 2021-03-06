class Frame

  attr_reader :scoreboard, :total

  def initialize
    @scoreboard = []
    @total = @scoreboard.sum
  end


end