class Game
  def initialize
    @rolls = []
    @current_roll = 0
    @score_board = [0,0,0,0,0]
  end

  def roll(pins_knocked)
    @rolls[@current_roll] = pins_knocked
    @current_roll += 1
  end

  def score
    accumulated_score = 0
    frame_index = 0
    (1..10).each do
      if @rolls[frame_index] == 10
        accumulated_score += 10 + bonus_for_strike(frame_index).to_i
        frame_index += 1
      elsif @rolls[frame_index] + @rolls[frame_index + 1] == 10
        accumulated_score += 10 + bonus_for_spare(frame_index).to_i
        frame_index += 2
      else
        accumulated_score += @rolls[frame_index].to_i + @rolls[frame_index + 1].to_i
        frame_index += 2
      end
    end
    return accumulated_score.to_i
  end

  def show_final_board
  #def show_final_board(player, frames, score)
    @score_board.each do |score|
      score
    end
    # shows the final score board with players' names
    # from players
    # from frames
  end

  private

  def bonus_for_strike(frame_index)
    @rolls[frame_index + 1].to_i + @rolls[frame_index + 2].to_i
  end

  def bonus_for_spare(frame_index)
    @rolls[frame_index + 2].to_i
  end
end
