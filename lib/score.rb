class Score


  def initialize
    @first_bowl_score
    @second_bowl_score
    @spare = false
    @strike = false
    @gutter = false

  end
  def first_bowl(score:)
    @first_bowl_score = score
  end

  def second_bowl(score:)
    @second_bowl_score = score
  end

  def spare?
 @strike = (@first_bowl_score + @second_bowl_score == 10) && (@strike == false) ? true : false
  end

  def strike?
    @strike = true if @first_bowl_score == 10
  end

  def gutter?
    @gutter = true if (@first_bowl_score || @second_bowl_score == 0)
  end
end