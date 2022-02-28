# frozen_string_literal: true

class Roll
  attr_reader :id, :frame_id, :score

  def initialize(id, frame_id, score)
    @id = id
    @frame_id = frame_id
    @score = score
  end

  #   def get_score(id, frame_id)
  #     return @score
  #   end
end
