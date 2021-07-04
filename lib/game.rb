
class Game

  def initialize
    @bowls = []
  end

  def bowl(pins_down)
    @bowls << pins_down
  end

  def score
    total_score = 0
    bowl_index= 0
    20.times do
      total_score += @bowls[bowl_index]
      bowl_index += 1
    end
    total_score
  end
end