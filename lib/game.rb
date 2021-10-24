require_relative 'player'
require_relative 'frame'
require_relative 'bonus'

class Game 
  
  attr_reader :players, :index

  def initialize(*player_names)
    raise "Max 4 players" if player_names.length > 4 
    @players = []
    player_names.each do |player| 
      @players << Player.new(player)
    end 
    new_index
  end 

  def switch_player
    if @index < (@players.length - 1)
      @index += 1 
    else 
      new_index
    end 
  end 

  def new_index 
    @index = 0 
  end 

  def next_player 
    switch_player if current.frames.last.complete? 
    puts "#{current.name} to bowl" unless complete?
  end 

  def current
    @players[@index]
  end 

  def play(hits)
    #return "Game is completed" if complete? 
    current.bowl(hits)
    puts "#{current.name} hit #{hits} pin(s)!"
    next_player
  end 

  def complete? 
    players.last.complete? 
  end 

  def print_player(player)
    board = player.scoreboard
    board_line = "-" * board.size
    puts board_line
    puts board
    puts board_line
  end

  def scoreboard
    players.each {|player| print_player(player)}
  end
end 

