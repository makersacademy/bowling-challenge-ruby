class Game 
  attr_reader :finished, :rolls

  def initialize
    @finished = false
    @rolls = []
  end

  def roll(pins)
    @rolls << pins
  end

  def finished?
    if @rolls.length == 12 || @rolls.length == 11 && @rolls[9] != 10
      @finished = true
    end
    @finished
  end
end
