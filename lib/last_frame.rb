# frozen_string_literal: true

require './lib/frame'
class LastFrame < Frame
  def frame_complete?
    return @rolls.count == 3 if bonus_frame?

    super
  end

  private

  def bonus_frame?
    strike_frame? || spare_frame?
  end
end
