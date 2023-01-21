class Game
  def initialize(io)
    @io = io
    @player_names = []
    @scorecard = []
  end

  def greeter
    @io.puts("Welcome to Bowling")
    @io.puts("Please enter the names of the players or type S to stop")
    player_counter = 1
    while true do
      @io.puts("Player #{player_counter}'s name:")
      player = @io.gets.chomp
      if player.downcase == "s"
        break
      else
        @player_names << player
      end
    end
    return @player_names
  end

  def scorecard_setup
    @player_names.each do |player|
      @scorecard << {player => []}
    end
    return @scorecard
  end
end

