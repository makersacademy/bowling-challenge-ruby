require_relative 'score'

class Frame
  attr_reader :score, :round
  def initialize(round:)
    @round = round
    @score = Score.new
  end
end