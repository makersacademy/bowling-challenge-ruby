require 'player'
require 'score'

class Game
  attr_reader :player, :score

  def initialize(player: Player.new, score: Score.new)
    @player = player
    @score = score
  end

end
