class Bowling

  attr_reader :score

  def initialize
    @score = []
  end

  def enter_score(pins)
    unless (0..10).include? pins
      raise 'Outside of Range'
    else
      score << pins
    end
  end
end