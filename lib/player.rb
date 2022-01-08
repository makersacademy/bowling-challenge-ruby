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
    if @current_frame == 10 && @current_roll == 2 && bonus_rolls?(points) == false
      points.add_bonus_points(@current_frame)
      puts points.score_breakdown(GAME_OVER)
      @current_frame = 1
      @current_roll = 1
    elsif @current_frame == 10 && bonus_rolls?(points) == true
      points.add_bonus_points(@current_frame)
      puts "INPUT BONUS ROLLS"
      puts "e.g. player.bonus_roll(5, points)"
    else
      update_roll_return_score(number, points, end_of_frame)
    end
  end

  def bonus_roll(number, points)
    end_of_frame = points.add_final_round_bonus_points(@current_frame, number)
    if end_of_frame == true
      puts points.score_breakdown(GAME_OVER)
      @current_frame = 1
      @current_roll = 1
    end
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

  def bonus_rolls?(points)
    points.frames[9].strike || points.frames[9].spare
  end
end
