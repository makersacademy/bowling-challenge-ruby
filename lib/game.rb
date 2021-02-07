class Game

  def initialize
    @rolls = []
  end

  def roll(pins)
    @rolls << pins
  end

  def score
    result = 0
    index = 0
    10.times do
      if @rolls[index] == 10
        result += @rolls[index].to_i + @rolls[index + 1].to_i + @rolls[index + 2].to_i
        index += 1
      elsif @rolls[index].to_i + @rolls[index + 1].to_i == 10
        result += @rolls[index].to_i + @rolls[index + 1].to_i + @rolls[index + 2].to_i
        index = index + 2
      elsif
        result += @rolls[index].to_i + @rolls[index + 1].to_i
        index = index + 2
      end
    end
    result
  end

end
