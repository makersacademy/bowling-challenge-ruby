require_relative './frame'
require_relative './game'

class UserInterface

  attr_reader :game

  def initialize
    @game = Game.new
  end

  def complete_frame
    @game.start_new_frame
    @game.play_current_frame
    @game.end_current_frame
  end

  def play_game
    while @game.current_turn < 10 do
      complete_frame
    end
  end

end
