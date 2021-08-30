require './lib/player'
# For a new game to be played the class must recieve an array with players names stored inside it
# game class will be responsible for calculating score and bonus points
# player class will keep track of pins knocked over during frames 
# a strike is a score of ten in a single throw 
# a spare is when both throws sum up to a total of ten pins [x,y] where x + y == 10

class Game 

  attr_reader :players
  
  def initialize(players)
    @players = Array.new
    players.each do |player| 
      @players << Player.new(player) 
    end
  end 

end
