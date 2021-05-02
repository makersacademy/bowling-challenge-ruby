require_relative 'player'
require_relative 'scorecard'

class Game
  attr_reader :scorecard, :frame, :roll, :player

  def initialize(input)
    @player = input[:player]
    @scorecard = input[:scorecard]
  end

  def self.begin_game(game)
    @game = game
  end

  def self.load_game
    @game
  end

  def bowl(score)
    @player.bowl(score)
    @scorecard.add_score(score)
  end
end
