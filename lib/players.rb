require 'player'

class Players
  def initialize
    @player_accumulated_score = []
    @players_list = []
  end

  def add_player(player)
    @players_list << player
  end

  def count_players
    @players_list.length
  end

  def show_players_list
    @players_list
  end

  def show_players_stats
    # displays player's name and score per frame
  end
end