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
        result += spare_result(index)
        index += 1
      elsif spare(index)
        result += spare_result(index)
        index += 2
      elsif result += regular_result(index)
        index += 2
      end
    end
    result
  end

  private

  def spare(index)
    @rolls[index].to_i + @rolls[index + 1].to_i == 10
  end

  def spare_result(index)
    @rolls[index].to_i + @rolls[index + 1].to_i + @rolls[index + 2]
  end

  def regular_result(index)
    @rolls[index].to_i + @rolls[index + 1].to_i
  end
end
