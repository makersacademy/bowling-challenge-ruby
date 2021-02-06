require 'player'

class Game

  attr_reader :players

  def initialize
    @players = Array.new
  end


  def start(players)
    players.times do
      @players.push(Player.new)
    end
  end

end
