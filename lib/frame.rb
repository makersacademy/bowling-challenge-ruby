# frozen_string_literal: true

class Frame
  attr_reader :number, :bowls, :score

  def initialize(number:, score_class: FrameScore)
    @score_class = score_class
    @number = number
    @bowls = []
    @score = nil
  end

  def add(bowl:)
    @bowls.push(bowl)
  end

  def pins
    @bowls.map(&:pins).sum
  end

  def push_score
    @score = @score_class.new(frame: self)
  end
  # private methods - add defers to normal_frame method or final_frame method?
end
