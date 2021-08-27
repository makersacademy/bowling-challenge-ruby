class Game 
  attr_reader :total_score, :frames, :rolls

  def initialize
    @total_score = 0
    @frames = [Frame.new]
    @rolls = []
  end

  def roll(pins)
    @rolls << pins
  end
end