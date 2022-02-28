class Game

  # attr_reader :score

  def initialize
    @rolls = []
  #   @score = 0
  end

  def roll(pins)
    @rolls << pins
  end

  def score
    result = 0
    rollindex = 0
    20.times do
      result += @rolls[rollindex]
      rollindex += 1
    end

    result
  end

  
    
  # end

  # def hits(pins_knocked)
  #   @score += pins_knocked
  # end

  
  
end