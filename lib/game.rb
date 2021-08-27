class Game 
  attr_reader :finished, :rolls

  def initialize
    @finished = false
    @rolls = []
  end

  def roll(pins)
    @rolls << pins
  end
end
