
class Game

  def initialize
    @bowls = []
  end

  def bowl(pins_down)
    if pins_down > 10 
      raise "Please enter a score of 10 or below"
    end
    @bowls << pins_down
  end

  def score
    total_score = 0
    bowl_index= 0
    10.times do
      if strike?(bowl_index)
        total_score += strike_score(bowl_index)
        bowl_index += 1
      elsif spare?(bowl_index)
        total_score += spare_score(bowl_index)
        bowl_index += 2
      else
        total_score += normal_frame_score(bowl_index)
        bowl_index += 2
      end
      
      
    end
    total_score
  end

  def spare?(bowl_index)
    @bowls[bowl_index] + @bowls[bowl_index + 1] == 10
  end

  def strike?(bowl_index)
    @bowls[bowl_index] == 10   
  end

  def strike_score(bowl_index)
    @bowls[bowl_index + 1] + @bowls[bowl_index + 2] + 10  
  end
  def spare_score(bowl_index)
    @bowls[bowl_index + 2] + 10
  end

  def normal_frame_score(bowl_index)
    @bowls[bowl_index] + @bowls[bowl_index + 1]
  end


end