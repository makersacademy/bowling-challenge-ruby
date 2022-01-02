# frozen_string_literal: true

class Player
  attr_reader :name, :current_frame

  GAME_OVER = 'GAME OVER'

  def initialize(name)
    @name = name
    @current_frame = 1
    @current_roll = 1
  end

  def pins_knocked_down(number, points)
    end_of_frame = points.update_roll(@current_frame, @current_roll, number)
    if @current_frame == 10 && @current_roll == 2
      # check if any bonus rolls need to take place, if not, end game


      # could be a strike with 1/2 bonus rolls
      # could be a spare with 0/1 bonus rolls
      # could be end of game


      # if current roll == 1 and strike  --> 2 bonus rolls
      # if current roll == 2 and spare --> 1 bonus roll
      # if current roll == 2 and no strike or spare --> end game
      puts points.score_breakdown(GAME_OVER)
      @current_frame = 1
      @current_roll = 1
    else
      update_roll_return_score(number, points, end_of_frame)
    end
  end

  def bonus_roll(number, points)
    points.add_final_round_bonus_points(@current_frame, number)
  end

  private

  def update_roll_return_score(number, points, end_of_frame)
    if end_of_frame == true
      points.add_bonus_points(@current_frame)
      @current_roll = 1
      update_frame
      points.current_score
    elsif @current_roll == 1
      @current_roll = 2
      number
    end
  end

  def update_frame
    if @current_frame < 10
      @current_frame += 1
    else
      @current_frame == 1
    end
  end
end
