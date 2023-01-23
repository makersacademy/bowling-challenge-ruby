class Bowling
  def initialize(io)
    @io = io
    @player_names = []
    @scorecard = []
    @one_player_score = []
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

  def scorecard_setup(player_names)
    player_names.each do |player|
      @scorecard << {player => []}
    end
    return @scorecard
  end

  def check_spare(num1, num2)
    num1 + num2 == 10 ? true : false
  end

  def check_strike(num)
    num == 10 ? true : false
  end

  def check_rolls(scorecard, player_name)
    scorecard[0][player_name].length % 2 == 0 ? true : false
  end

  def run_game(scorecard)
    while true do
      @io.puts("Please enter your roll")
      player_roll = @io.gets.chomp.to_i
      @one_player_score << player_roll
      if @one_player_score.length % 2 == 1 && check_strike(player_roll) == false
        @io.puts("Please roll again")
      else
        @io.puts("Your turn is over")
        break
      end
    end
    return @one_player_score.sum
  end
end

