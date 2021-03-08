# frozen_string_literal: true

class Frame
  attr_reader :number, :bowls, :score

  def initialize(number:, score_table:, framescore_class: FrameScore)
    @framescore_class = framescore_class
    @number = number
    @bowls = []
    @score = nil
    @score_table = score_table
  end

  def add(bowl:)
    @bowls.push(bowl)
  end

  def pins
    @bowls.map(&:pins)
  end

  def pins_total
    @bowls.map(&:pins).sum
  end

  def push_score
    @score = @framescore_class.new(frame: self, score_table: @score_table)
  end
end
