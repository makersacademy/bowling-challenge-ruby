require_relative './frame'

class Game

  attr_reader :current_turn, :game_score, :current_frame, :frames

  def initialize
    @current_turn = 0
    @game_score = 0
    @frames = []
  end

  def start_game
    @current_turn = 1
    @current_frame = Frame.new
  end

  def play_current_frame(first_roll, second_roll = 0)
    @current_frame.add_roll_score(first_roll)
    @current_frame.add_roll_score(second_roll) unless second_roll == 0
  end

  def end_current_frame
    @current_frame.set_total_score
    @frames << @current_frame
    @current_frame = nil
  end

end
