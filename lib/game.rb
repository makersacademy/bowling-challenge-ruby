require_relative './frame'

class Game

  attr_reader :current_turn, :game_score, :current_frame, :frames

  def initialize
    @current_turn = 0
    @game_score = 0
    @frames = []
  end

  def start_new_frame
    @current_turn += 1
    @current_frame = Frame.new
  end

  def roll_current_frame(first_roll, second_roll = 0)
    @current_frame.add_roll_score(first_roll) #first roll
    @current_frame.add_roll_score(second_roll) unless second_roll == 0 #second roll provided first roll wasn't a strike
    mark_current_frame? #mark this roll as strike or spare if appropriate
    @frames.last.total_score += first_roll if @frames.length >= 1 && @frames.last.spare == true #add a spare bonus to previous spare if appropriate
  end

  def end_current_frame
    @current_frame.set_total_score
    @frames << @current_frame
    @current_frame = nil
  end

  def mark_current_frame?
    @current_frame.mark_as_strike?
    @current_frame.mark_as_spare?
  end

end
