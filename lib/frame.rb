# frozen_string_literal: true

class Frame
  attr_accessor :id, :roll_id, :num_of_rolls, :total_score, :bonus_num

  def initialize(id, roll_id, num_of_rolls, total_score, bonus_num)
    @id = id
    @roll_id = roll_id
    @num_of_rolls = num_of_rolls
    @total_score = total_score
    @bonus_num = bonus_num
  end
end
