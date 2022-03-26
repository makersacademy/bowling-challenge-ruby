# frozen_string_literal: true

require_relative 'score'

class Frame
  attr_reader :frame, :score, :frame_score

  def initialize(frame:)
    @frame = frame
    @score = Score.new
    @frame_score = []
  end

  def frame_score(first_bowl, second_bowl)
    first_bowl + second_bowl
  end
end
