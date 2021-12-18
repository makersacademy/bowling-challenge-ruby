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
    points.update_roll(@current_frame, @current_roll, number)
    if @current_frame == 10 && @current_roll == 2
      puts points.score_breakdown(GAME_OVER)
      @current_frame = 1
      @current_roll = 1
    else
      update_roll_return_score(number, points)
    end
  end

  private

  def update_roll_return_score(number, points)
    case @current_roll
    when 1
      @current_roll += 1
      number
    when 2
      @current_roll -= 1
      update_frame
      points.current_score
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
