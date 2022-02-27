# frozen_string_literal: true

class Frame
  attr_reader :id, :roll_id, :num_of_rolls, :total_score, :bonus_num

  def initialize(id, roll_id, num_of_rolls, total_score, bonus_num)
    @id = id
    @roll_id = roll_id
    @num_of_rolls = num_of_rolls
    @total_score = total_score
    @bonus_num = bonus_num
  end

  #   def get_score(id, frame_id)
  #     return @score
  #   end
end
