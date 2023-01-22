class Frame
  def initialize
    @frame_score = []
  end

  def first_roll(score_1)
    if score_1 == 10
      return @frame_score.push(score_1)
    else 
      return @frame_score
    end
  end

  def second_roll(score_2) 
    if score_1 + score_2 == 10
      return @frame_score.push(score_2)
    else 
      return score_2
    end 
  end

  # def all
  #   return @frame_score
  # end
end