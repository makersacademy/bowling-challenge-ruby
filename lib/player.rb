# frozen_string_literal: true

class Player
  attr_reader :id, :name, :frames, :player_total

  def initialize(id, name, frames, player_total)
    @id = id
    @name = name
    @frames = frames
    @player_total = player_total
  end

  # def add_roll(roll)
  #   @roll_id = roll.id
  #   @roll_num_of_rolls += 1
  #   @total_score += roll.score
  #   if @total_score = 10
  #     if @roll_num_of_rolls == 1
  #       @bonus_num = 2
  #     else
  #       @bonus_num = 1
  #     end
  #   end
  #   return self
  # end

  def bowl(current_frame, skittles_down)
    current_frame.num_of_rolls += 1
    current_frame.total_score += skittles_down
    current_frame
  end
end
