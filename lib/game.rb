
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
    10.times do
      if spare?(bowl_index)
        total_score += spare_score(bowl_index)
      else
        total_score += normal_frame_score(bowl_index)
      end
      bowl_index += 2
      
    end
    total_score
  end

  def spare?(bowl_index)
    @bowls[bowl_index] + @bowls[bowl_index + 1] == 10
  end

  def spare_score(bowl_index)
    @bowls[bowl_index + 2] + 10
  end

  def normal_frame_score(bowl_index)
    @bowls[bowl_index] + @bowls[bowl_index + 1]
  end
end