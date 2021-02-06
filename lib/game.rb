require './lib/player'

class Game

  attr_reader :players

  def initialize
    @players = Array.new
  end


  def start(players)
    x = 0
    players.times do
      x += 1
      @players.push({"Player #{x}" => Player.new})
    end
  end
end
