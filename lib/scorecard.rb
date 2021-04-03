require_relative 'bowling_game'

class Scorecard
  attr_accessor :roll_1_score, :roll_2_score, :roll_3_score, :bonus_score
  attr_reader :scorecard, :total_game_score

  def initialize
    @scorecard = []
    @roll_1_score = 0
    @roll_2_score = 0
    @roll_3_score = nil
    @bonus_score = 0
    @total_game_score = 0
  end

  def update_bonus(players_score)
    @bonus_score += players_score
  end

  def update_scorecard(current_frame, strike, spare)
    running_total(current_frame)

    if @current_frame == 10 && spare
      @scorecard[current_frame-2][:"frame_#{current_frame-1}"][:bonus] = @roll_1_score
    elsif @current_frame == 10 && strike
      @scorecard[current_frame-2][:"frame_#{current_frame-1}"][:bonus] = @roll_1_score + @roll_2_score
    elsif spare || strike
      @scorecard[current_frame-2][:"frame_#{current_frame-1}"][:bonus] = @bonus_score
      @scorecard[current_frame-2][:"frame_#{current_frame-1}"][:total] += @bonus_score
    end

    @total_game_score+=@bonus_score
    @bonus_score = 0

    @scorecard << { "frame_#{current_frame}": { roll_1: @roll_1_score, roll_2: @roll_2_score, roll_3: @roll_3_score, bonus: @bonus_score, total: @total_game_score }}
  end

  def running_total(current_frame)
    if current_frame < 10
      @total_game_score += @roll_1_score + @roll_2_score
    else
      @total_game_score+=@roll_1_score + @roll_2_score + @roll_3_score
    end
  end
end
